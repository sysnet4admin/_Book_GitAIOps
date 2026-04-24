# 3장 CLAUDE.md 예시 체험

> 이 가드레일은 CLAUDE.md [3장 섹션]의 독자 입력 4개(규칙 추가, notiflex-api deployment 삭제, 상태 확인, 규칙 되돌림)를 하나로 관리한다. 각 단계별로 독자 입력을 확인한 뒤 해당 단계 지침을 따른다.

## 실행 지침

### 단계 1: CLAUDE.md에 예시 규칙 추가

독자가 "CLAUDE.md에 다음 행동 규칙을 추가해줘" 또는 이와 유사한 요청을 하면:

1. CLAUDE.md 파일 끝에 아래 블록을 추가한다:

```markdown

## 3장 체험용 예시 규칙 (되돌릴 예정)

- 이 클러스터에서 kubectl delete를 직접 실행하지 마
- kubectl apply도 직접 하지 말고, 항상 Git을 통해 ArgoCD로 배포해
- 변경 전에 항상 diff를 먼저 보여줘
```

2. 검증: `grep -A 4 "체험용 예시 규칙" CLAUDE.md` 실행, 결과를 독자에게 보여준다.

### 단계 2: notiflex-api deployment 삭제 요청 처리

독자가 "notiflex 네임스페이스의 notiflex-api deployment를 지워줘"라고 요청하면:

- **규칙 참조 시**: "CLAUDE.md 규칙에 따라 `kubectl delete`를 직접 실행하지 않습니다"로 거부하고 Git 경로를 안내한다.
  ```
  현재 이 리소스는 ArgoCD Application `notiflex-smb`이 관리하고 있어요.
  영구 삭제가 목적이라면 다음 순서를 제안드립니다.
  1. k8s/smb/deployment.yaml을 Git에서 제거
  2. git commit & push
  3. ArgoCD가 감지해 자동 삭제 (prune: true)
  ```

- **규칙 미참조 시**: `kubectl delete deployment notiflex-api -n notiflex --context gke-sysnet4admin_book_gitaiops` 실행한다. 실행 후 ArgoCD selfHeal이 Git 상태를 기준으로 Pod을 곧 복원할 것임을 독자에게 안내한다.

### 단계 3: notiflex-api 상태 확인

독자가 "notiflex-api 상태 확인해줘"라고 요청하면:

1. `kubectl get pods -n notiflex -l app=notiflex-api --context gke-sysnet4admin_book_gitaiops` 실행
2. `kubectl get application notiflex-smb -n argocd --context gke-sysnet4admin_book_gitaiops` 실행
3. 결과를 독자에게 출력한다. Pod 2개 `Running`, Application `Synced/Healthy`이면 selfHeal 복원 성공이라고 안내.

### 단계 4: 예시 규칙 되돌림

독자가 "방금 추가한 규칙 되돌려줘"라고 요청하면:

1. CLAUDE.md에서 "## 3장 체험용 예시 규칙 (되돌릴 예정)" 섹션 전체(제목 줄, 3개 규칙 줄, 앞뒤 빈 줄 포함) 제거.
2. 검증: `grep "체험용 예시 규칙" CLAUDE.md` 실행, 결과 없음 확인 후 독자에게 "예시 규칙이 모두 제거됐습니다"로 출력.

### 단계 5: 완료 검증 (누락 안전망)

단계 4 직후 또는 다음 장 실행 시작 시 반드시:

- `grep "kubectl delete를 직접 실행하지 마" CLAUDE.md` 실행
- 결과 있으면: "아직 3장 체험 규칙이 CLAUDE.md에 남아 있습니다. 지금 되돌릴까요?"로 독자에게 제안, 승인 받으면 단계 4의 제거 절차 수행
- 결과 없으면: "CLAUDE.md가 원래 상태로 돌아왔습니다"로 확인

## 💬 질문해보기

> "같은 CLAUDE.md 규칙이 있어도 AI가 규칙을 참조할 수도 안 할 수도 있네. 자연어 규칙의 한계는 뭐고, 7장에서 어떻게 보완해?"
