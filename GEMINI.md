# GEMINI.md

> 이 책은 **Claude Code**를 기준으로 쓰였습니다. **Gemini CLI**에서도 동작 가능합니다.
> 본 파일은 Gemini 한정 차이점만 다루며, 책 본문 가이드는 **반드시 같은 디렉터리의
> `CLAUDE.md`를 먼저 읽어주세요**.

## 1. 인증 (가장 중요)

Gemini API의 Free Tier는 **Pro 모델 quota=0** (2026-04-01 정책 변경)이므로 책 실습엔 **부적합**합니다.

| 옵션 | 가능한 모델 | 비용 | 추천도 |
|---|---|---|---|
| **Vertex AI** (GCP project + ADC) | gemini-2.5-pro, gemini-3.x preview | GCP 빌링 (신규 $300 크레딧) | ⭐ **권장** |
| Google AI Studio Pay-as-you-go | 모두 | $1.25/1M input, $10/1M output | 신용카드 등록 필요 |
| Free Tier (API key) | Flash만 (5~25 RPD) | 무료 | ❌ Agentic 작업 불가 |

### Vertex AI 셋업 (권장 경로)

```bash
# 1. Vertex AI API 활성화
gcloud services enable aiplatform.googleapis.com

# 2. Application Default Credentials 설정
gcloud auth application-default login --no-launch-browser   # 다른 브라우저 사용 가능
gcloud auth application-default set-quota-project <PROJECT_ID>

# 3. 환경변수 (Gemini CLI가 Vertex AI 사용하도록)
export GOOGLE_GENAI_USE_VERTEXAI=true
export GOOGLE_CLOUD_PROJECT=<PROJECT_ID>
export GOOGLE_CLOUD_LOCATION=us-central1   # gemini Pro 가용 region
unset GEMINI_API_KEY                         # API key 무력화
```

## 2. 실행 명령

| Claude Code | Gemini CLI |
|---|---|
| `claude --dangerously-skip-permissions` | `gemini --yolo --model gemini-2.5-pro --include-directories <work_dir>` |

`--yolo`: 모든 도구 호출 자동 승인 (= claude의 dangerously-skip-permissions 대응)
`--include-directories <work_dir>`: 작업 저장소(notiflex-platform)를 추가 워크스페이스로 포함
`-p "<prompt>"`: 비대화형 (headless) 모드, 단일 prompt 실행
`-r/--resume`: 이전 세션 이어가기 (codex와 달리 메모리 보존 가능 ⭐)

## 3. 알려진 동작 차이 (vs Codex/Claude)

### 보수적 도구 사용 (가장 큰 차이)
- `--yolo` 모드여도 **shell 명령(git/build/kubectl) 실행은 보수적**
- 파일 read/edit는 적극적이나 **명령 실행을 사용자에게 위임**하는 경향
- 책의 "X 만들고 배포해줘"를 "사용자가 진행하도록 가이드 작성"으로 해석 가능
- **권고**: 명시적으로 "**도구를 직접 호출하여 실행하라**" prompt에 포함

### 컨텍스트 파일 자동 로드
- Gemini CLI는 `settings.json`의 `contextFileName`에 정의된 파일을 자동 로드
- 기본값에 `AGENTS.md` 포함됨 → 본 GEMINI.md와 함께 양쪽 다 로드 가능
- 책 본문(CLAUDE.md)도 명시적으로 읽도록 prompt에 안내 권장

### 모델 선택
- Free Tier: Flash만 가능 (Pro 차단)
- Vertex AI: gemini-2.5-pro 등 Pro 사용 가능
- 책 실습엔 **gemini-2.5-pro 이상** 권장 (agentic capability)

### Skill / Subagent 부재
- Claude Code의 `/skill`, `Agent` subagent는 Gemini에 없음
- `/update-docs`, `/cluster-audit` 등은 수동 진행 (해당 prompt-guardrails 직접 참조)
- 단 Gemini도 `gemini skills` (extension 형태) 지원 — 본 책은 미사용

## 4. 책 본문 진행

이하 모든 가이드는 `CLAUDE.md`와 동일하게 따릅니다:
- `decision-guides/` — 도구 선택 근거
- `prompt-guardrails/` — 단계별 실행 지침
- `result-templates/` — 검증 체크리스트

세 디렉터리는 도구 명칭(Edit/Write 등)과 무관하므로 어느 에이전트에서나 동일하게 동작합니다.

## 5. 권장 prompt 형식 (Gemini 한정)

Gemini의 보수적 동작을 우회하기 위해, 책 prompt에 다음 명시 권장:

| 일반 (Claude/Codex 무관) | Gemini 권장 |
|---|---|
| "Notiflex 앱 만들고 배포해줘" | "Notiflex 앱 만들고 배포해줘. **도구를 직접 호출하여 git, build, kubectl 명령을 실행해라**." |
| "ArgoCD 설치해줘" | "ArgoCD 설치해줘. **kubectl, helm 명령을 직접 실행하고 결과를 검증하라**." |

## 6. 다른 에이전트 AI

- Codex CLI: `AGENTS.md` (별도 파일) — 본 책 저장소 루트에 있음
- Claude Code: `CLAUDE.md` (책 본문 가이드)
