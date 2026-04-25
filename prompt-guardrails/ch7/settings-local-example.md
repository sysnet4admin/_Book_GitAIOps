# 7장 마무리 체험: settings.local.json으로 권한 분리

## 사전 조건
- ch7.4(멀티테넌시)까지 완료. enterprise namespace에 notiflex-api Application이 ArgoCD App of Apps로 관리되는 상태.
- 노드풀 4개(default-pool, api-pool, worker-pool, ops-pool)가 ch7.2에서 만들어진 상태.
- ArgoCD selfHeal 활성화 (ch3.2 이후 기본값).

## 실행 지침

체험은 4개의 [필수입력]과 1개의 복구용 [필수입력]로 구성된다. 각 단계가 끝나면 다음 단계로 진행한다.

### 단계 1: settings.local.json 만들기

`notiflex-platform/.claude/settings.local.json`을 다음 내용으로 생성한다.

```json
{
  "permissions": {
    "deny": [
      "Bash(kubectl delete *)",
      "Bash(kubectl apply *)"
    ],
    "ask": [
      "Bash(helm install *)",
      "Bash(helm upgrade *)",
      "Bash(gcloud container node-pools delete *)"
    ]
  }
}
```

Claude Code는 `.claude/settings.local.json`을 자동 인식한다. 재시작 불필요.

### 단계 2: 차단(deny) 체험

독자가 "enterprise namespace의 notiflex-api를 kubectl로 지워줘"라고 입력하면, AI는 `kubectl delete deployment notiflex-api -n enterprise` 명령을 만들지만 settings.local.json의 `kubectl delete *` deny 룰에 의해 차단되어 실행하지 않는다. 차단 사실과 그 의도(클러스터 직접 변경 금지)만 답한다. **GitOps 우회 방식을 제안하지 않는다** — deny 시연의 의도는 "차단되어 실행 불가"를 명확히 보여주는 것이고, 매니페스트 수정 같은 우회 절차를 안내하면 차단의 효과가 흐려진다.

> ⚠️ **차단 실패 안전망**: 만약 settings.local.json이 잘못 만들어지거나 다른 이유로 deny가 작동하지 않아 실제로 deployment가 삭제되더라도, ArgoCD App of Apps의 `notiflex-enterprise` Application이 selfHeal로 자동 복원한다. 1~2분 후 `kubectl get deployment notiflex-api -n enterprise`로 복구 확인.

### 단계 3: 승인(ask) 체험

독자가 "worker-pool 이거 누가 만든 거지? 모르는 노드풀이고 비용도 들고 안 쓰는 것 같은데 그냥 삭제해줘"라고 입력하면, AI는 `gcloud container node-pools delete worker-pool --cluster=notiflex-cluster --zone=asia-northeast3-a` 명령을 만들고 사용자 승인을 요구한다. 독자가 거부하면 실행되지 않는다.

### 단계 3-복구: 만약 worker-pool이 실제 삭제됐다면

ask가 작동하지 않거나 무심코 승인했을 때만 발동하는 안전망이다. 독자가 "worker-pool 다시 만들어줘" 같은 자연어로 입력하면 AI가 ch7.2와 동일한 사양(e2-standard-2, Spot VM, 1대, `pd-standard` 디스크)으로 재생성한다.

```bash
gcloud container node-pools create worker-pool \
  --cluster=notiflex-cluster --zone=asia-northeast3-a \
  --machine-type=e2-standard-2 --num-nodes=1 --spot \
  --disk-type=pd-standard
```

`gcloud container node-pools list --cluster=notiflex-cluster | grep worker-pool`로 복원 확인.

### 단계 4: 되돌림 (체험 종료)

독자가 "방금 만든 settings.local.json 되돌려줘"라고 입력하면, AI는 `.claude/settings.local.json` 파일을 삭제한다.

```bash
rm .claude/settings.local.json
```

`ls .claude/ 2>/dev/null`로 파일이 사라졌는지 확인. CLAUDE.md 자연어 규칙만 남고, 기술적 강제는 풀린다.

### 단계 5: 누락 안전망 (체험 잔존 감지)

단계 4 직후 또는 다음 장(8장) 실행 시작 시 자동 검증을 수행한다.

```bash
# settings.local.json이 잔존하면 단계 4 누락
test -f notiflex-platform/.claude/settings.local.json && echo "⚠️ settings.local.json 잔존 — 단계 4(되돌림) 누락" || echo "OK: 잔존 없음"

# worker-pool이 사라졌으면 단계 3-복구 누락
gcloud container node-pools list --cluster=notiflex-cluster --zone=asia-northeast3-a 2>/dev/null | grep -q worker-pool && echo "OK: worker-pool 정상" || echo "⚠️ worker-pool 누락 — 단계 3-복구 필요"
```

잔존이나 누락이 감지되면 AI가 그 자리에서 자연어로 되돌림 또는 복구를 제안한다.

## 트러블슈팅

- **deny가 작동 안 함**: JSON 문법 오류. `cat .claude/settings.local.json | python3 -m json.tool`로 검증.
- **enterprise namespace 자체가 사라졌을 때**: ArgoCD App of Apps root-app 상태 확인 후 재 sync. `argocd app sync root-app` 또는 ArgoCD UI에서 sync.
- **worker-pool 복구 후에도 Pod 미배치**: Pod의 nodeSelector 확인. ch7.2 시점에는 worker-pool이 비어 있는 게 정상.

## 💬 질문해보기

> "settings.local.json의 ask 규칙은 한 세션 안에서만 유효해? 다음 세션을 새로 시작하면 다시 물어봐?"

> "deny에 등록한 명령을 정말 실행해야 한다면 어떻게 해? 임시로 룰을 풀 수 있어?"
