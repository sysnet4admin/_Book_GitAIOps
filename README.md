# AI 시대에 개발자가 알아야 하는 인프라 구성 배포 with 클로드 코드

**🇰🇷 한국어** | [🇬🇧 English](README.en.md)

<a href="">
<img src="" width="400">
</a>
</br>

![Claude Code](https://img.shields.io/badge/Claude_Code-D97757?style=flat-square&logo=anthropic&logoColor=white)
![GitAIOps](https://img.shields.io/badge/GitAIOps-0F172A?style=flat-square&logo=git&logoColor=white)
![GitOps](https://img.shields.io/badge/GitOps-EF7B4D?style=flat-square&logo=argo&logoColor=white)
![GKE](https://img.shields.io/badge/GKE-4285F4?style=flat-square&logo=googlecloud&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=flat-square&logo=kubernetes&logoColor=white)
![ArgoCD](https://img.shields.io/badge/ArgoCD-EF7B4D?style=flat-square&logo=argo&logoColor=white)
![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=flat-square&logo=prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=flat-square&logo=grafana&logoColor=white)
![Observability](https://img.shields.io/badge/Observability-7B68EE?style=flat-square&logo=opentelemetry&logoColor=white)
![CI/CD](https://img.shields.io/badge/CI%2FCD-2088FF?style=flat-square&logo=githubactions&logoColor=white)
![Cloud Native](https://img.shields.io/badge/Cloud_Native-231F20?style=flat-square&logo=cncf&logoColor=white)

이 저장소는 [AI 시대에 개발자가 알아야 하는 인프라 구성 배포 with 클로드 코드]() 책의 실습을 위한 코드를 제공합니다.

Claude Code와 함께 GKE 위에서 SMB → Enterprise 수준의 배포 파이프라인을 구축하고, 그 과정에서 자연스럽게 살아있는 운영 표준(GitAIOps)을 만들어갑니다.

---

## 저장소 구조

```
├── ch1~ch9/            # 장별 요약 (README.md)
├── apx/                # 부록 (부록A: 온보딩 가이드, 부록B: 대규모 프로젝트)
├── decision-guides/    # 도구 선택 가이드: "뭐 쓰면 돼?", "비교해줘" 시 참조
├── prompt-guardrails/  # 실행 가드레일: "설치해줘", "진행해줘" 시 참조
├── result-templates/   # 검증 체크리스트: 실행 후 결과 대조용
├── CLAUDE.md           # Claude Code 동작 규칙: clone 후 자동 적용
└── README.md
```

### 가드레일 시스템

이 저장소를 clone한 디렉터리에서 Claude Code를 실행하면, `CLAUDE.md`가 자동으로 로드됩니다. 이후 자연어로 질문하면 3단계 흐름이 동작합니다:

1. **탐색**: "뭘 쓰면 돼?" → `decision-guides/` 참조하여 추천 + 이유 설명
2. **비교**: "비교해줘" → `decision-guides/` 비교 섹션으로 대안 비교
3. **실행**: "설치해줘" → `prompt-guardrails/` 지침대로 작업 수행 → `result-templates/`로 검증

---

## 제공되는 챕터별 내용

| 구간 | 장 | 내용 | 스토리 |
|:----:|:---:|------|--------|
| **도입** | [ch1](ch1/) | <small>AI 시대, 개발자의 인프라</small> | <small>왜 개발자가 인프라를 알아야 하는가</small> |
| **기반** | [ch2](ch2/) | <small>환경 구성과 첫 서비스 배포</small> | <small>스타트업 창업, 첫 서비스 배포</small> |
| **SMB** | [ch3](ch3/) | <small>첫 번째 배포 파이프라인</small> | <small>배포할 때마다 긴장된다 → GitOps + CI 자동화</small> |
| **SMB** | [ch4](ch4/) | <small>관측 가능성 한번에 구축하기</small> | <small>새벽에 고객이 "안 된다"고 연락 → 관측 가능성 구축</small> |
| **SMB** | [ch5](ch5/) | <small>무중단 배포</small> | <small>배포할 때마다 끊긴다 → Gateway API + 무중단 배포</small> |
| **전환기** | [ch6](ch6/) | <small>Enterprise를 위한 기반 정비</small> | <small>고객이 늘면서 느려지고, 보안도 허술 → 캐시, 시크릿, Canary</small> |
| **Enterprise** | [ch7](ch7/) | <small>규모 확장</small> | <small>대형 고객사 계약! → 인프라 확장과 테넌트 분리</small> |
| **Enterprise** | [ch8](ch8/) | <small>고도화</small> | <small>서비스 간 호출이 꼬인다 → 이벤트 드리븐, 트레이싱, 배치 자동화</small> |
| **종합** | [ch9](ch9/) | <small>GitAIOps: 살아있는 운영 표준</small> | <small>돌아보니, 이 모든 기록이 운영 표준이 되어 있었다</small> |
| **부록** | [부록A](apx/) | <small>AI로 만든 온보딩 가이드</small> | <small>9.3에서 언급한 온보딩 문서 생성 예시</small> |
| **부록** | [부록B](apx/) | <small>AI와 함께 설계하는 대규모 프로젝트</small> | <small>대규모 프로젝트에서의 문서 체계 확장</small> |

---

## 독자 실습 저장소

이 저장소는 가이드 저장소입니다. 독자는 `notiflex-platform` 이름으로 자신의 실습 저장소를 직접 생성합니다. 저자가 완성한 GitAIOps 플랫폼의 구조와 상태는 아래에서 확인할 수 있습니다.

- 완성된 플랫폼: https://github.com/sysnet4admin/notiflex-platform

---

## 📌 정오표 (오류 수정 및 추가 정보 제공)

본 도서의 쇄(edition)별 정정 사항은 [Releases](../../releases)에서 확인하실 수 있습니다.

---

## 저자
- ✔️   [조 훈](https://github.com/sysnet4admin)

## 도서 구입 안내

본 도서는 각 온오프라인 서점에서 만나보실 수 있습니다.

- 📍  교보문고
- 📍  예스24
- 📍  알라딘
