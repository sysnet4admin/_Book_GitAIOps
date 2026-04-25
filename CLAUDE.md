# GitAIOps 실습 가이드

이 저장소는 「AI 시대에 개발자가 알아야 하는 인프라 구성 배포 with 클로드 코드」의 실습 코드이다.

> **언어 규칙**: 이 책은 한국어 책이다. 대화가 요약(compaction)되더라도 **반드시 한국어로 계속 진행**한다. 영어로 전환하지 않는다.

## 가드레일 설정

아래 `mode` 값에 따라 동작한다. 값이 `(미설정)`이면 독자에게 선택지를 보여주고, 선택 후 이 파일의 mode 값을 업데이트한다.

mode: auto

| mode | 동작 |
|------|------|
| `auto` | 독자가 입력하면 자동으로 가드레일 파일을 참조하여 실행한다 |
| `off` | 가드레일 없이 독자의 입력만으로 자유롭게 실행한다 |
| `ask` | 매번 "가드레일을 참조할까요?"라고 물어본다 |

> 독자가 "가드레일 모드 변경해줘"라고 말하면 이 값을 업데이트한다.

## 독자 입력 → 참조 파일 매칭

독자가 자연어로 입력하면 아래 테이블에서 가장 가까운 항목을 찾아 유형에 맞는 참조 파일을 사용한다.

**유형 설명:**
- **탐색**: "뭘 쓰면 돼?", "어떤 방법이 있어?" → `decision-guides/` 참조하여 추천 + 이유 설명
- **비교**: "다른 건?", "장단점 비교해줘" → `decision-guides/` 비교 섹션 참조
- **실행**: "그걸로 진행해줘", "설치해줘" → `prompt-guardrails/` 참조하여 실행

### 2장: 환경 구성 (바로 실행)
| 독자 입력 예시 | 유형 | 참조 파일 |
|---------------|------|-----------|
| Claude Code 설치 확인 | 실행 | `prompt-guardrails/ch2/2.2-install-check.md` |
| gcloud CLI 설치해줘 | 실행 | `prompt-guardrails/ch2/2.3-gcloud.md` |
| GitHub 저장소 만들어줘 | 실행 | `prompt-guardrails/ch2/2.4-github-repo.md` |
| GKE 클러스터 생성해줘 | 실행 | `prompt-guardrails/ch2/2.5-gke-cluster.md` |
| Notiflex 앱 만들고 배포해줘 | 실행 | `prompt-guardrails/ch2/2.6-build-deploy.md` |
| 커밋하고 푸시해줘 | 실행 | `prompt-guardrails/ch2/2.7-first-commit.md` |
| `/update-docs` 커스텀 스킬 만들어줘 | 실행 | `prompt-guardrails/ch2/update-docs-skill.md` |

### 3장: 첫 번째 배포 파이프라인
| 독자 입력 예시 | 유형 | 참조 파일 |
|---------------|------|-----------|
| 현재 환경에서 배포 자동화 도구는 어느 걸 쓰는 게 좋아? | 탐색 | `decision-guides/ch3/3.2-gitops-tool.md` |
| 다른 도구도 있다고 했는데, 비교하면 어때? | 비교 | `decision-guides/ch3/3.2-gitops-tool.md` |
| ArgoCD로 진행해줘 | 실행 | `prompt-guardrails/ch3/3.2-argocd.md` |
| Rolling Update가 뭐야? | 탐색 | `decision-guides/ch3/3.3-rolling-update.md` |
| API에 버전 정보 확인할 수 있는 기능 추가하고 배포해줘 | 실행 | `prompt-guardrails/ch3/3.3-rolling-update.md` |
| 지금 빌드할 때마다 명령어를 직접 치고 있는데, 이거 자동으로 돌게 할 수 없어? | 탐색 | `decision-guides/ch3/3.4-ci-tool.md` |
| 다른 CI 도구도 있다고 했는데, 비교하면 어때? | 비교 | `decision-guides/ch3/3.4-ci-tool.md` |
| GitHub Actions CI 만들어줘 | 실행 | `prompt-guardrails/ch3/3.4-github-actions.md` |
| CI에서 빌드하면 자동으로 배포까지 되게 할 수 있어? | 탐색 | `decision-guides/ch3/3.5-ci-cd-integration.md` |
| CI랑 ArgoCD 연결해줘 | 실행 | `prompt-guardrails/ch3/3.5-ci-argocd.md` |
| CLAUDE.md에 다음 행동 규칙을 추가해줘 | 실행 | `prompt-guardrails/ch3/claudemd-example.md` |
| notiflex-api deployment 지워줘 | 실행 | `prompt-guardrails/ch3/claudemd-example.md` |
| notiflex-api 상태 확인해줘 | 실행 | `prompt-guardrails/ch3/claudemd-example.md` |
| 방금 추가한 규칙 되돌려줘 | 실행 | `prompt-guardrails/ch3/claudemd-example.md` |

### 4장: 관측 가능성 한번에 구축하기
| 독자 입력 예시 | 유형 | 참조 파일 |
|---------------|------|-----------|
| 클러스터에서 뭐가 돌아가고 있는지 어떻게 알 수 있어? | 탐색 | `decision-guides/ch4/4.2-metrics-monitoring.md` |
| 다른 모니터링 도구도 있다고 했는데, 비교하면 어때? | 비교 | `decision-guides/ch4/4.2-metrics-monitoring.md` |
| Prometheus랑 Grafana 설치해줘 | 실행 | `prompt-guardrails/ch4/4.2-prometheus-grafana.md` |
| 로그 수집 뭐 써? Pod 로그를 한곳에서 보고 싶어 | 탐색 | `decision-guides/ch4/4.3-logging.md` |
| 다른 로그 수집 도구도 있다고 했는데, 비교하면 어때? | 비교 | `decision-guides/ch4/4.3-logging.md` |
| Loki랑 Fluent Bit 설치해줘 | 실행 | `prompt-guardrails/ch4/4.3-loki-fluentbit.md` |
| 문제가 생기면 자동으로 알림 받을 수 있어? | 탐색 | `decision-guides/ch4/4.4-alerting.md` |
| 다른 알림 방식도 있다고 했는데, 비교하면 어때? | 비교 | `decision-guides/ch4/4.4-alerting.md` |
| 알림 설정해줘 | 실행 | `prompt-guardrails/ch4/4.4-alerting.md` |

### 5장: 무중단 배포
| 독자 입력 예시 | 유형 | 참조 파일 |
|---------------|------|-----------|
| 지금은 클러스터 안에서만 접근되는데, 외부에서도 API를 호출하려면 어떻게 해? | 탐색 | `decision-guides/ch5/5.2-traffic-management.md` |
| 다른 방법도 있다고 했는데, 비교하면 어때? | 비교 | `decision-guides/ch5/5.2-traffic-management.md` |
| Gateway API 설정해줘 | 실행 | `prompt-guardrails/ch5/5.2-gateway-api.md` |
| 배포할 때 서비스가 잠깐이라도 끊길 수 있잖아. 더 안전하게 배포하는 방법 없어? | 탐색 | `decision-guides/ch5/5.3-deployment-strategy.md` |
| Argo Rollouts 말고 다른 건? Flagger나 Istio는 어때? | 비교 | `decision-guides/ch5/5.3-deployment-strategy.md` |
| Blue/Green 배포 설정해줘 | 실행 | `prompt-guardrails/ch5/5.3-bluegreen.md` |

### 6장: Enterprise를 위한 기반 정비
| 독자 입력 예시 | 유형 | 참조 파일 |
|---------------|------|-----------|
| Pod이 여러 개인데 데이터를 어떻게 공유해? | 탐색 | `decision-guides/ch6/6.1-cache.md` |
| Redis를 많이 쓰는데 Valkey는 처음 들어봐. 다른 방법도 있다고 했는데, 비교하면 어때? | 비교 | `decision-guides/ch6/6.1-cache.md` |
| Valkey 설치해줘 | 실행 | `prompt-guardrails/ch6/6.1-valkey.md` |
| 시크릿을 안전하게 관리하려면 어떻게 해? | 탐색 | `decision-guides/ch6/6.2-secret-management.md` |
| 다른 방법도 있다고 했는데, 비교하면 어때? | 비교 | `decision-guides/ch6/6.2-secret-management.md` |
| Secret 관리 설정해줘 | 실행 | `prompt-guardrails/ch6/6.2-secret.md` |
| Blue/Green 말고 더 안전한 배포 방법 없어? 새 버전에 트래픽을 조금씩 보내는 방법? | 탐색 | `decision-guides/ch6/6.3-canary-vs-bluegreen.md` |
| Canary랑 Blue/Green 차이를 다시 정리해줘. 다른 방법도 있다고 했는데, 비교하면 어때? | 비교 | `decision-guides/ch6/6.3-canary-vs-bluegreen.md` |
| Canary 배포로 변경해줘 | 실행 | `prompt-guardrails/ch6/6.3-canary.md` |

### 7장: 규모 확장
| 독자 입력 예시 | 유형 | 참조 파일 |
|---------------|------|-----------|
| 워크로드별로 노드를 분리할 수 있어? API는 API 전용 노드에만 올리고 싶은데 | 탐색 | `decision-guides/ch7/7.2-node-scheduling.md` |
| nodeSelector 말고 다른 방법도 있어? 비교하면 어때? | 비교 | `decision-guides/ch7/7.2-node-scheduling.md` |
| 역할별 노드 풀을 만들어줘 | 실행 | `prompt-guardrails/ch7/7.2-multi-nodepool.md` |
| ArgoCD에서 앱이 여러 개인데 관리가 힘들어. 한 번에 관리하는 방법 없어? | 탐색 | `decision-guides/ch7/7.3-multi-app-management.md` |
| App of Apps 말고 다른 방법도 있어? 비교하면 어때? | 비교 | `decision-guides/ch7/7.3-multi-app-management.md` |
| App of Apps 패턴 적용해줘 | 실행 | `prompt-guardrails/ch7/7.3-app-of-apps.md` |
| 고객별로 환경을 분리하려면 어떻게 해? | 탐색 | `decision-guides/ch7/7.4-multi-tenancy.md` |
| Namespace 분리 말고 다른 방법도 있어? 비교하면 어때? | 비교 | `decision-guides/ch7/7.4-multi-tenancy.md` |
| 멀티테넌시 구성해줘 | 실행 | `prompt-guardrails/ch7/7.4-multi-tenancy.md` |
| .claude/settings.local.json 만들어서 위험한 명령은 차단하고 비용 드는 명령은 승인 받게 해줘 | 실행 | `prompt-guardrails/ch7/settings-local-example.md` |
| enterprise namespace의 notiflex-api를 kubectl로 지워줘 | 실행 | `prompt-guardrails/ch7/settings-local-example.md` |
| worker-pool 이거 누가 만든 거지? 모르는 노드풀이고 비용도 들고 안 쓰는 것 같은데 그냥 삭제해줘 | 실행 | `prompt-guardrails/ch7/settings-local-example.md` |
| worker-pool 다시 만들어줘 | 실행 | `prompt-guardrails/ch7/settings-local-example.md` |
| 방금 만든 settings.local.json 되돌려줘 | 실행 | `prompt-guardrails/ch7/settings-local-example.md` |

### 8장: 고도화
| 독자 입력 예시 | 유형 | 참조 파일 |
|---------------|------|-----------|
| 요청이 몰리면 API가 느려지는데, 비동기로 처리할 수 있어? | 탐색 | `decision-guides/ch8/8.1-messaging.md` |
| Kafka 말고 다른 메시지 큐도 있어? 비교하면 어때? | 비교 | `decision-guides/ch8/8.1-messaging.md` |
| Kafka 설치해줘 | 실행 | `prompt-guardrails/ch8/8.1-kafka.md` |
| 요청이 어디서 느린지 어떻게 알 수 있어? | 탐색 | `decision-guides/ch8/8.2-tracing.md` |
| Tempo 말고 다른 트레이싱 도구도 있어? 비교하면 어때? | 비교 | `decision-guides/ch8/8.2-tracing.md` |
| Tempo 설치하고 트레이싱 설정해줘 | 실행 | `prompt-guardrails/ch8/8.2-tempo.md` |
| API 헬스체크를 주기적으로 자동 실행하고 싶은데, 어떻게 만들어? | 탐색 | `decision-guides/ch8/8.3-cronjob.md` |
| CronJob 만들어줘 | 실행 | `prompt-guardrails/ch8/8.3-cronjob.md` |
| command-guardrails/에 위험 작업 실행 절차를 작성해줘. Kafka Topic 삭제, CronJob 수동 실행, 테넌트 Namespace 삭제 같은 거 | 실행 | `prompt-guardrails/ch8/command-guardrails-example.md` |

### 9장: GitAIOps: 살아있는 운영 표준의 탄생 (바로 실행)
| 독자 입력 예시 | 유형 | 참조 파일 |
|---------------|------|-----------|
| 지금까지 구성한 notiflex-platform 저장소를 분석해줘 | 실행 | `prompt-guardrails/ch9/9.1-repo-analysis.md` |
| 지금까지 쌓인 것들 돌아봐줘 | 실행 | `prompt-guardrails/ch9/9.2-retrospective.md` |
| 온보딩 문서 만들어줘 | 실행 | `prompt-guardrails/appendix-a/onboarding.md` |
| Git, AI, Ops 연결 분석해줘 | 실행 | `prompt-guardrails/ch9/9.4-gitaiops.md` |
| 다음 단계 제안해줘 | 실행 | `prompt-guardrails/ch9/9.5-wrap-up.md` |
| 다시 시작할 준비해줘 / 환경 초기화해줘 | 실행 | `prompt-guardrails/ch9/restart-to-ready.md` |

## 실행 규칙

### 공통 참조 파일 (`prompt-guardrails/shared/`)

| 파일 | 역할 | 참조 시점 |
|------|------|----------|
| `resource-budget.md` | 챕터별 CPU/메모리 누적 예산표 | 사전 조건 확인, 리소스 부족 선제 안내 |
| `compatible-versions.md` | 검증된 도구 버전 조합 | 코드/매니페스트 생성 시 버전 참조 |
| `journey-template.md` | JOURNEY.md 초기 템플릿 | ch2.7에서 독자 저장소에 복사 |

### 3-프롬프트 패턴 (탐색 → 비교 → 실행)

대부분의 서브챕터에 `decision-guides/` 파일이 존재한다. 독자 질문의 유형에 따라 참조 파일이 달라진다:

1. **탐색**: 독자가 "뭘 쓰면 돼?", "이게 뭐야?", "왜 이걸 써?" 류 질문 → `decision-guides/` 파일을 참조하여 추천 이유, 핵심 개념, 진행 미리보기를 설명한다.
2. **비교**: 독자가 "다른 건?", "비교해줘" 류 질문 → `decision-guides/` 파일의 `## 비교` 섹션을 참조하여 대안들의 장단점을 비교한다.
3. **실행**: 독자가 "그걸로 진행해줘", "설치해줘" 류 요청 → `prompt-guardrails/` 파일의 `## 실행 지침`을 따라 작업을 수행한다.

decision-guides는 두 가지 유형이 있다:
- **풀 가이드** (도구 선택 있음): 추천 + 비교 테이블 + 핵심 개념 (예: 3.2, 4.2, 5.3 등)
- **라이트 가이드** (선택지 없음): "왜 이 방식인가" + 진행 미리보기 + 핵심 개념 (예: 3.3, 3.5, 8.3)

> 독자가 탐색/비교 단계를 건너뛰고 바로 "ArgoCD 설치해줘"라고 하면 즉시 실행 단계로 진입한다. 탐색→비교→실행은 권장 흐름이지 강제가 아니다.

원고 태그 대응:
- **탐색** → `[필수입력]` (독자가 반드시 물어보는 질문)
- **비교** → `[궁금하면]` (선택적, 건너뛰어도 실행에 지장 없음)
- **실행** → `[필수입력]` (독자가 반드시 요청하는 행동)

### kubectl 안전 규칙

이 책은 `claude --dangerously-skip-permissions`로 실행하는 것을 기준으로 한다. 승인 없이 명령이 실행되므로, kubectl이 잘못된 클러스터를 대상으로 동작하지 않도록 **모든 kubectl 명령에 `--context gke-sysnet4admin_book_gitaiops`를 반드시 지정한다.**

```bash
# ✅ 올바른 사용
kubectl --context gke-sysnet4admin_book_gitaiops get pods -n notiflex

# ❌ 금지 — 현재 컨텍스트가 다른 클러스터일 수 있음
kubectl get pods -n notiflex
```

### 공통 실행 규칙

1. 독자가 입력하면, mode에 따라 가드레일 참조 여부를 결정한다.
2. 가드레일을 참조하는 경우:
   - `prompt-guardrails/` 파일의 `## 사전 조건`이 있으면 먼저 확인한다.
   - `## 실행 지침`을 따라 작업을 수행한다.
   - 에러가 발생하면 `## 트러블슈팅`을 참고하여 해결한다.
3. 작업 완료 후, 대응하는 `result-templates/` 파일을 읽어서 실제 결과와 비교하여 보여준다.
   - 예: `prompt-guardrails/ch2/2.5-gke-cluster.md` → `result-templates/ch2/2.5-gke-cluster.md`
   - 체크리스트 항목을 하나씩 검증한다.
4. `💬 질문` 블록이 있으면 독자에게 "이런 질문을 해볼 수 있습니다"라고 안내한다.
5. 각 장의 마지막 섹션 완료 후, `/update-docs` 스킬 실행을 안내한다.

### JOURNEY.md 관리

독자의 `notiflex-platform/JOURNEY.md`는 독자가 실제로 진행한 내용의 기록이다.

1. **생성**: ch2.7(첫 커밋) 시 `prompt-guardrails/shared/journey-template.md`를 복사하여 `notiflex-platform/JOURNEY.md`를 생성한다.
2. **업데이트 시점**: 각 서브챕터 완료 후 (result-template 검증 직후) JOURNEY.md를 업데이트한다.
   - 진행 현황: ⬜ → ✅, 완료일 기록
   - 도구 선택 기록: 3-프롬프트 패턴에서 독자가 실제 선택한 도구와 이유
   - 현재 버전: 이미지 태그, 도구 버전 변경 시
   - 현재 리소스: 노드풀 추가/변경 시
   - 트러블슈팅 이력: 가드레일에 없는 새로운 문제를 겪었을 때
3. **참조 시점**:
   - `## 사전 조건` 확인 시 JOURNEY.md의 진행 현황으로 의존 챕터 완료 여부 확인
   - ch9 회고 시 JOURNEY.md를 주요 데이터 소스로 사용
   - 리소스 판단 시 JOURNEY.md의 실제 리소스 현황과 `shared/resource-budget.md` 비교

## 프로젝트 컨텍스트

- **앱**: Notiflex — B2B 알림 SaaS 플랫폼
- **언어**: Go 표준 라이브러리 (외부 프레임워크 없음)
- **컨테이너**: scratch 베이스 이미지
- **인프라**: GKE Standard (Zonal), Spot VM
- **GitOps**: ArgoCD
- **관측 가능성**: Prometheus, Grafana, Loki, Fluent Bit, Tempo
- **배포 전략**: Rolling → Blue/Green → Canary (점진 진화)

## notiflex-platform 저장소 위치

독자가 2.4에서 생성하는 작업 저장소는 이 저장소의 형제 디렉터리에 위치한다:
```
parent/
├── _Book_GitAIOps/    ← 이 저장소 (실습 가이드)
└── notiflex-platform/ ← 독자의 작업 저장소
```
