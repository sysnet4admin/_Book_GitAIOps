# 7장. [Enterprise] 규모 확장

> **스토리**: 대형 고객사 계약! 전용 환경 요청 → 인프라 확장과 테넌트 분리

멀티 노드풀로 워크로드를 분리하고, App of Apps 패턴으로 여러 앱을 체계적으로 관리합니다. Namespace 기반 멀티테넌시로 테넌트를 격리합니다.

---

| 절 | 제목 |
|:---:|------|
| 7.1 | <small>성장통: SMB 구조의 한계</small> |
| 7.2 | <small>워크로드별 노드 배치: 멀티 노드풀</small> |
| 7.3 | <small>다수 앱 관리: App of Apps 패턴 + Sync Wave</small> |
| 7.4 | <small>멀티테넌시: Namespace 격리</small> |
| 💡 | <small>마무리: `settings.local.json`으로 권한 분리 체험</small> |

> 자세한 내용은 책을 참고하세요.
