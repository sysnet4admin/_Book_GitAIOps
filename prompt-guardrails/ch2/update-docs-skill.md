# /update-docs 커스텀 스킬 만들기

## 사전 조건

ch2.7 첫 커밋까지 완료. `notiflex-platform/` 저장소가 존재한다.

## 실행 지침

### 단계 1: 스킬 디렉터리 준비

`notiflex-platform/.claude/commands/`가 없으면 생성한다.

### 단계 2: 스킬 파일 작성

`.claude/commands/update-docs.md`를 다음 내용으로 만든다.

```markdown
---
description: 저장소 문서를 현재 작업 기준으로 갱신하고 변경 사항 커밋
---

# /update-docs

실행 절차:

1. 이번 장 작업에서 변경된 내용을 파악한다 (Git 커밋 기록, 도입된 도구나 설정, 결정 사항, 규칙이나 컨텍스트 변경).

2. 저장소 문서를 파악한 내용에 맞춰 갱신한다. 후보 (존재하는 것만 처리):
   - `JOURNEY.md` — 진행 현황, 도구 선택, 현재 버전, 리소스 상태
     **진행 현황**: 이번 장에서 완료한 서브챕터를 ⬜ → ✅로 변경하고 완료일(YYYY-MM-DD)을 기록한다. 비워두거나 건너뛰지 않는다.
     **현재 버전**: 이번 장에서 설치하거나 버전이 바뀐 컴포넌트는 추측하지 않고 클러스터에서 직접 조회해 채운다. 비워두지 않는다.
     - Notiflex 이미지: `kubectl --context gke-sysnet4admin_book_gitaiops get rollout notiflex-api -n notiflex -o jsonpath='{.spec.template.spec.containers[0].image}'`
     - ArgoCD: `kubectl --context gke-sysnet4admin_book_gitaiops get deploy argocd-server -n argocd -o jsonpath='{.spec.template.spec.containers[0].image}'`
     - Kafka: `kubectl --context gke-sysnet4admin_book_gitaiops get kafka -n kafka -o jsonpath='{.items[0].spec.kafka.version}'`
     - 그 외 도구: `kubectl --context gke-sysnet4admin_book_gitaiops get pod -n <namespace> -l <label> -o jsonpath='{.items[0].spec.containers[0].image}'`
     **현재 리소스**: 노드풀이 추가·변경됐으면 `kubectl --context gke-sysnet4admin_book_gitaiops get nodes -L cloud.google.com/gke-nodepool`로 조회해 테이블을 갱신한다.
   - `CLAUDE.md` — 규칙이나 컨텍스트가 바뀐 경우
   - `docs/architecture-decisions.md` — 결정 사항 누적 (도입: 5장)
     **파일이 존재하는 경우에만**: `JOURNEY.md`의 도구 선택 기록 테이블에서 직전 장에 새로 추가된 결정을 **모두** 찾아 ADR 항목으로 추가한다. 같은 장에 여러 결정이 있으면 전부 포함한다 (예: ch7에 nodeSelector + App of Apps가 있으면 둘 다 ADR로 변환). 번호는 기존 마지막 ADR 번호 +1부터 순서대로 매긴다. 파일이 없으면 건너뛴다 (신설은 ch5 가드레일이 담당).
     **ADR 형식 준수 필수**: 각 ADR은 반드시 아래 형식으로 작성한다. `**이유**:` 뒤에 `-` 불릿 리스트로 3~4가지 이유를 작성한다. 이유를 단일 줄이나 쉼표로 압축하지 않는다.
     ```
     ## ADR-NNN: 짧은 결정 제목 (N장)
     **시점**: YYYY-MM / **결정**: 무엇을 채택하고 무엇을 안 쓰는지 한 문장
     **이유**:
     - 이유 1 (가장 결정적인 근거)
     - 이유 2
     - 이유 3
     - 이유 4 (필요 시)
     ```
   - `claude-context/` — 현재 아키텍처 스냅샷 (도입: 6장)
     **파일이 존재하는 경우**: 이번 장에서 아키텍처가 변경됐으면 반드시 갱신한다. 갱신 대상 예시: 노드풀 추가(ch7.2), 새 네임스페이스(ch7.4), Kafka/Tempo/CronJob 추가(ch8). 파일 맨 위의 "N장 완료 시점" 텍스트도 현재 장으로 업데이트한다. 건너뛰면 AI가 오래된 아키텍처를 참조하게 된다.
   - `command-guardrails/` — 위험 명령 절차 (도입: 8장)

3. 새로 추가된 문서와 기존 문서의 내용 변경을 모두 반영한 뒤 Git에 커밋한다 (메시지는 이번 장 요약).

존재하지 않는 문서는 건너뛴다. 이후 장에서 새 문서가 추가되면 스킬은 수정 없이 그대로 그 문서까지 포함해 갱신한다.
```

### 단계 3: 인식 확인

Claude Code는 `.claude/commands/<이름>.md` 단일 파일을 자동 등록한다. 재시작 없이 다음 장부터 `/update-docs`로 호출 가능하다.

## 💬 질문해보기

> "이 스킬 파일을 나중에 보조 스크립트와 함께 묶고 싶으면 `.claude/skills/update-docs/SKILL.md`로 옮겨도 동일하게 동작해?"
