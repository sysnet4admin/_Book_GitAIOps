# 5장. [SMB] 무중단 배포

> **스토리**: 배포할 때마다 서비스가 끊긴다 → 무중단 배포

롤링 업데이트의 한계를 이해하고, Gateway API로 외부 트래픽을 관리합니다. Argo Rollouts와 Gateway API를 연동하여 Blue/Green 무중단 배포를 구현합니다.

---

| 절 | 제목 |
|:---:|------|
| 5.1 | <small>Rolling Update는 왜 서비스가 끊기는가</small> |
| 5.2 | <small>외부 트래픽 관리: Gateway API</small> |
| 5.3 | <small>무중단 전환: Blue/Green 배포</small> |
| 💡 | <small>마무리: 아키텍처 결정 기록하기</small> |

> 자세한 내용은 책을 참고하세요.
