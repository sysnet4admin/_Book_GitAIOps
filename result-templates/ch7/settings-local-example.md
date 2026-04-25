# 7장 마무리 체험: settings.local.json — 예상 결과

## 단계별 검증

### 단계 1: 파일 생성

```
$ ls .claude/
settings.local.json

$ cat .claude/settings.local.json | python3 -m json.tool
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

### 단계 2: 차단 메시지

AI가 `kubectl delete deployment notiflex-api -n enterprise`를 차단하고, GitOps 방식 안내를 출력한다.

### 단계 3: 승인 요청

AI가 `gcloud container node-pools delete worker-pool ...` 명령을 보여주며 "실행할까요? [Y/n]" 형태로 사용자 승인을 요구한다.

### 단계 4: 파일 삭제

```
$ ls .claude/ 2>/dev/null
(empty)
```

## 체크리스트

- [ ] 단계 1: `.claude/settings.local.json` 생성, JSON 문법 정상
- [ ] 단계 2: 차단 동작 확인 (deployment 그대로 존재)
- [ ] 단계 3: 승인 요청 확인 (worker-pool 그대로 존재)
- [ ] 단계 4: `.claude/settings.local.json` 삭제 확인
- [ ] 단계 5: settings.local.json 잔존 없음, worker-pool 정상 존재

## 이 단계 이후 상태

```
notiflex-platform/.claude/
└── commands/
    └── update-docs.md
(settings.local.json은 체험 후 되돌렸으므로 없음)

GKE 노드풀:
├── default-pool (e2-medium × 2)
├── api-pool (e2-medium × 1)
├── worker-pool (e2-standard-2 × 1)  ← 단계 3은 거부 또는 복구로 유지
└── ops-pool (e2-small × 1)
```
