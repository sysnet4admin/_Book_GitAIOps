# 8장 마무리: command-guardrails/ — 예상 결과

## 상태 확인

```
$ ls notiflex-platform/command-guardrails/
cronjob-manual-run.md
kafka-topic-delete.md
tenant-namespace-delete.md

$ wc -l notiflex-platform/command-guardrails/*.md
  17 cronjob-manual-run.md
  15 kafka-topic-delete.md
  18 tenant-namespace-delete.md
  50 total
```

각 파일은 `## 사전 확인`, `## 실행`, `## 사후 검증` 3단 구조를 갖는다.

## 체크리스트

- [ ] `command-guardrails/` 디렉터리 생성
- [ ] `kafka-topic-delete.md` 작성 (사전 확인 → 실행 → 사후 검증)
- [ ] `cronjob-manual-run.md` 작성 (수동 일회성 Job 생성·정리 포함)
- [ ] `tenant-namespace-delete.md` 작성 (ArgoCD Application 우선 제거 절차 포함)
- [ ] 세 파일 모두 동일 3단 구조

## 이 단계 이후 상태

```
notiflex-platform/
├── CLAUDE.md
├── JOURNEY.md
├── docs/
│   └── architecture-decisions.md  (ADR-001~016)
├── claude-context/
│   └── architecture.md
├── command-guardrails/             ← 8장에서 신설
│   ├── kafka-topic-delete.md
│   ├── cronjob-manual-run.md
│   └── tenant-namespace-delete.md
└── ...
```

영구 누적 자산 4종(CLAUDE.md, claude-context/, docs/architecture-decisions.md, command-guardrails/)이 모두 갖춰진 상태. 이후 `/update-docs` 호출 시 `git status`에 `A command-guardrails/`가 표시된다.
