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
   - `CLAUDE.md` — 규칙이나 컨텍스트가 바뀐 경우
   - `docs/architecture-decisions.md` — 결정 사항 누적 (도입: 5장)
   - `claude-context/` — 현재 아키텍처 스냅샷 (도입: 6장)
   - `command-guardrails/` — 위험 명령 절차 (도입: 8장)

3. 새로 추가된 문서와 기존 문서의 내용 변경을 모두 반영한 뒤 Git에 커밋한다 (메시지는 이번 장 요약).

존재하지 않는 문서는 건너뛴다. 이후 장에서 새 문서가 추가되면 스킬은 수정 없이 그대로 그 문서까지 포함해 갱신한다.
```

### 단계 3: 인식 확인

Claude Code는 `.claude/commands/<이름>.md` 단일 파일을 자동 등록한다. 재시작 없이 다음 장부터 `/update-docs`로 호출 가능하다.

## 💬 질문해보기

> "이 스킬 파일을 나중에 보조 스크립트와 함께 묶고 싶으면 `.claude/skills/update-docs/SKILL.md`로 옮겨도 동일하게 동작해?"
