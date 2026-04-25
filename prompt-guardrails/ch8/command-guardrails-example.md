# 8장 마무리: command-guardrails/로 위험 작업 절차 정리

## 사전 조건
- ch8.3(CronJob)까지 완료. Kafka, Tempo, CronJob이 모두 클러스터에서 정상 동작 중.
- ch7 마무리 settings.local.json 체험은 끝나고 되돌린 상태(영구 작동 중인 차단·승인 룰 없음).

## 실행 지침

### 단계 1: command-guardrails/ 디렉터리 작성

`notiflex-platform/command-guardrails/` 디렉터리를 만들고 다음 3개 절차서를 추가한다.

#### 1-1. `command-guardrails/kafka-topic-delete.md`

```markdown
# Kafka Topic 삭제

## 사전 확인
1. Topic에 미처리 메시지가 있는지 확인
2. Consumer가 모두 처리를 완료했는지 확인
3. 이 Topic을 사용하는 Producer 목록 파악

## 실행
1. 관련 Producer를 먼저 중지 (메시지 유입 차단)
2. Consumer가 잔여 메시지를 모두 처리할 때까지 대기
3. KafkaTopic 리소스 삭제

## 사후 검증
1. Topic이 삭제되었는지 확인
2. 관련 Producer/Consumer에 에러가 없는지 로그 확인
```

#### 1-2. `command-guardrails/cronjob-manual-run.md`

```markdown
# CronJob 수동 실행

## 사전 확인
1. CronJob의 schedule과 lastScheduleTime 확인 (직전 실행과 충돌하지 않는지)
2. 수동 실행 시 영향 범위 파악 (외부 API 호출, 데이터 갱신 등)

## 실행
1. `kubectl create job <name> --from=cronjob/<cronjob-name>` 으로 일회성 Job 생성
2. Job의 Pod 로그 모니터링

## 사후 검증
1. Job 완료 상태 확인 (Completed)
2. 결과가 의도한 대로 처리됐는지 확인 (예: 헬스체크 알림 정상 발송)
3. 수동 실행한 Job 정리(`kubectl delete job <name>`) — CronJob과 별개라 자동 정리 안 됨
```

#### 1-3. `command-guardrails/tenant-namespace-delete.md`

```markdown
# 테넌트 Namespace 삭제

## 사전 확인
1. 해당 namespace의 모든 워크로드 식별
2. PVC·Secret·ConfigMap 등 영구 자원 백업 필요성 판단
3. 다른 namespace에서 cross-namespace로 참조하는 리소스가 있는지 확인 (예: 공유 Valkey DNS)
4. ArgoCD Application(`notiflex-<tenant>`)이 이 namespace를 관리하는지 확인

## 실행
1. ArgoCD Application 먼저 제거 (`argocd/apps/notiflex-<tenant>.yaml` 삭제 → git push)
2. ArgoCD가 Application과 그 안의 리소스를 정리하기를 대기
3. 잔여 리소스가 있으면 매니페스트에서 제거하고 git push (kubectl delete 직접 사용 금지)

## 사후 검증
1. ArgoCD UI에서 Application이 사라졌는지 확인
2. `kubectl get all -n <namespace>`로 리소스가 모두 정리됐는지 확인
3. 남은 namespace에서 cross-namespace 참조가 끊겼는지 로그 확인
```

### 단계 2: 절차서 활용 흐름

이후 독자가 위 작업을 요청하면 Claude Code는 `command-guardrails/`의 절차서를 참조해 사전 확인 → 실행 → 사후 검증 순으로 안내한다. 절차서 자체는 영구 자산으로 git에 누적된다(체험 후 삭제 X).

## 트러블슈팅

- **절차서를 참조 안 함**: AI가 자연어 요청을 보고 `command-guardrails/`를 자동 매칭하지 못하면, 사용자가 명시적으로 "command-guardrails/의 절차를 참고해서 진행해줘"라고 지시.
- **절차서가 부족하면 추가**: 새 위험 작업이 생기면 같은 형식(사전 확인 → 실행 → 사후 검증)으로 한 파일 추가.

## 💬 질문해보기

> "command-guardrails/의 절차서가 있는데도 Claude Code가 다른 방식으로 시도한다면 왜 그래?"

> "절차서 형식을 더 풍부하게(롤백, 영향 범위, 권한 요건 등) 만드는 게 좋아? 아니면 사전 확인 → 실행 → 사후 검증 3단으로 단순하게 유지?"
