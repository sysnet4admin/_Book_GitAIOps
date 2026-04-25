# 4장. [SMB] 관측 가능성 한번에 구축하기

> **스토리**: 새벽에 고객이 "서비스가 안 된다"고 연락, 뭐가 문제인지 모른다

메트릭(Prometheus + Grafana), 로그(Loki + Fluent Bit), 알림(PrometheusRule + Alertmanager)을 구축하여 클러스터에서 무슨 일이 일어나고 있는지 한 화면에서 볼 수 있게 합니다.

---

| 절 | 제목 |
|:---:|------|
| 4.1 | <small>관측 가능성이란</small> |
| 4.2 | <small>메트릭 모니터링: Prometheus + Grafana</small> |
| 4.3 | <small>로그 수집: Loki + Fluent Bit</small> |
| 4.4 | <small>알림 설정: PrometheusRule</small> |
| 💡 | <small>마무리: memory에 작업 컨텍스트 기록</small> |

> 자세한 내용은 책을 참고하세요.
