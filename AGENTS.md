# AGENTS.md

> 이 책은 **Claude Code**를 기준으로 쓰였습니다. **Codex CLI** 등 다른 에이전트 AI에서도
> 유사하게 동작합니다. 본 파일은 Codex 한정 차이점만 다루며, 책 본문 가이드는
> **반드시 같은 디렉터리의 `CLAUDE.md`를 먼저 읽어주세요**.

## 1. 실행 명령

| Claude Code | Codex CLI |
|---|---|
| `claude --dangerously-skip-permissions` | `codex --full-auto --sandbox danger-full-access` |

`danger-full-access`가 필요한 이유:
- Codex 기본 sandbox(`workspace-write`)는 외부 네트워크를 차단합니다.
- 본 책은 외부 클러스터(GKE/AKS/onprem)에 `kubectl`로 접근하므로 네트워크 허용이 필수입니다.

## 2. Skill → 직접 명령 매핑

Claude Code의 `/skill` 단축은 Codex에 없습니다. 동등한 작업을 직접 진행:

| Claude Skill | Codex 대체 |
|---|---|
| `/update-docs` | 수동 진행 — 대응하는 `prompt-guardrails/` 파일 참조 |

## 3. 알려진 제약 (Codex 한정)

- **자동 메모리 없음**: Claude Code의 `~/.claude/projects/.../memory/`에 해당하는 기능이 없습니다.
  → `notiflex-platform/JOURNEY.md`를 더 자주 갱신하여 진행 상태를 명시적으로 기록하세요.
- **Subagent 분리 호출 없음**: Claude의 `Agent` 도구로 격리 호출하는 패턴이 없습니다.
  → 단일 대화에서 진행하면 됩니다 (책 가드레일은 subagent에 직접 의존하지 않음).
- **statusline·슬래시 명령 차이**: ch2.2의 statusline 절은 Claude Code 전용입니다.
  → Codex는 자체 statusline을 사용하며, `/h /s /o` 같은 모델 전환 슬래시도 다릅니다 (`/model`).

## 4. 책 본문 진행

이하 모든 가이드는 `CLAUDE.md`와 동일하게 따릅니다:
- `decision-guides/` — 도구 선택 근거
- `prompt-guardrails/` — 단계별 실행 지침
- `result-templates/` — 검증 체크리스트

세 디렉터리는 도구 명칭(Edit/Write 등)과 무관하므로 어느 에이전트에서나 동일하게 동작합니다.

## 5. 다른 에이전트 AI

본 패턴은 다른 에이전트 AI (예: Gemini CLI)에도 유사하게 적용 가능합니다.
각 에이전트의 진입점 파일 컨벤션(`AGENTS.md`, `GEMINI.md` 등)을 따라 본 파일과
유사한 차이점 어댑터를 추가하면 됩니다.
