# 부록 A: 온보딩 문서 생성

## 실행 지침

notiflex-platform에 ONBOARDING.md를 생성한다.
실제 클러스터 상태를 조회하여 작성한다.

### 필수 포함 항목

1. **클러스터 실제 상태 조회**
   - `kubectl get nodes` (노드풀별 머신 타입, 용도, 워크로드)
   - `kubectl get pods -A` (네임스페이스별 Pod 수 집계 + 역할 테이블)

2. **저장소 디렉터리 구조**
   - app/, k8s/, argocd/, helm-values/ 기본 구조
   - claude-context/, command-guardrails/, .claude/ 포함

3. **접근 방법**
   - ArgoCD UI (port-forward + 초기 비밀번호 조회 명령)
   - Grafana (port-forward + 데이터소스별 사용법: Prometheus, Loki, Tempo)
   - API 엔드포인트 (Gateway IP + curl 예시)

4. **배포 플로우**
   - git push → CI → 이미지 빌드 → 매니페스트 업데이트 → ArgoCD → Canary 단계별

5. **자주 묻는 Q&A** (최소 6개)
   - Canary abort 방법
   - 로그 검색 (Loki LogQL)
   - 트레이스 추적 (Tempo TraceID)
   - Kafka 토픽 추가
   - 새 테넌트 추가
   - 알림 확인 (Alertmanager)

## 💬 질문해보기

> "AI가 만든 온보딩 문서가 사람이 만든 것과 뭐가 달라? AI가 코드베이스를 분석해서 문서를 자동 생성하면 어떤 장점이 있어?"
