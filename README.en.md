# AI Agent-Driven Infrastructure: Build, Deploy, and Operate with Claude Code

[한국어](README.md) | **English**

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

> 📖 **This repository accompanies a Korean book.** This English page explains *what* the project is and *why* it is built this way. The full hands-on guide (the guardrails, decision guides, and verification templates) is written in Korean, because the AI reads them in Korean exactly as the book presents them.

This is the companion repository for the book *"AI Agent-Driven Infrastructure: Build, Deploy, and Operate with Claude Code."* Working alongside Claude Code, you build a deployment pipeline on GKE that grows from SMB to Enterprise scale, and along the way you naturally produce a **living operational standard** the book calls **GitAIOps**.

---

## What is GitAIOps?

GitAIOps is the idea that emerges when you let an AI agent operate infrastructure under version control:

- **Git** is the single source of truth for your infrastructure.
- **AI** is a living author of the operational standard, not a one-off code generator but a collaborator that reads the project's accumulated context and keeps the standard current.
- **Ops** decisions are captured as they happen (in `CLAUDE.md`, architecture snapshots, and ADRs) so that both humans and AI can review and build on them.

Instead of asking the AI to "write a script," you give it durable **guardrails** and let it carry out real operational work safely.

---

## How the guardrail system works

When you clone this repository and run Claude Code inside it, `CLAUDE.md` is loaded automatically. From then on, plain-language requests flow through three stages:

1. **Explore**: *"What should I use?"* → Claude consults `decision-guides/` and recommends a tool with reasoning.
2. **Compare**: *"How does it compare to the alternatives?"* → Claude reads the comparison section of `decision-guides/`.
3. **Execute**: *"Set it up."* → Claude follows the steps in `prompt-guardrails/`, then validates the result against `result-templates/`.

This separation is what keeps an autonomous agent on the rails: it knows *which tool*, *why*, *how to install it*, and *how to confirm it actually worked*.

---

## Repository layout

```
├── ch1~ch9/            # Per-chapter summaries (README.md)
├── apx/                # Appendices (A: onboarding guide, B: large-scale projects)
├── decision-guides/    # Tool-selection guides (for "what should I use?" / "compare them")
├── prompt-guardrails/  # Execution guardrails (for "set it up" / "go ahead")
├── result-templates/   # Verification checklists (to confirm results)
├── CLAUDE.md           # Operating rules for Claude Code (auto-loaded after clone)
└── README.md
```

---

## Chapters

| Track | Ch | Topic | Story |
|:-----:|:---:|------|-------|
| **Intro** | [ch1](ch1/) | Infrastructure for developers in the AI era | Why developers must understand infrastructure |
| **Foundation** | [ch2](ch2/) | Environment setup & first deployment | Founding a startup, shipping the first service |
| **SMB** | [ch3](ch3/) | First deployment pipeline | Every deploy is nerve-racking → GitOps + CI automation |
| **SMB** | [ch4](ch4/) | Building observability in one pass | A 3 a.m. "it's down" call → observability stack |
| **SMB** | [ch5](ch5/) | Zero-downtime deployment | Deploys cause outages → Gateway API + zero-downtime |
| **Transition** | [ch6](ch6/) | Hardening for Enterprise | More customers, slower & less secure → cache, secrets, Canary |
| **Enterprise** | [ch7](ch7/) | Scaling out | A big contract! → infra scaling and tenant isolation |
| **Enterprise** | [ch8](ch8/) | Advanced operations | Tangled service calls → event-driven, tracing, batch automation |
| **Synthesis** | [ch9](ch9/) | GitAIOps: a living operational standard | In hindsight, the whole record had become the standard |
| **Appendix** | [Appendix A](apx/) | An AI-generated onboarding guide | Example referenced in 9.3 |
| **Appendix** | [Appendix B](apx/) | Designing large-scale projects with AI | Extending the documentation system |

---

## The reader's practice repository

This is the **guide** repository. As you follow the book, you create your own practice repository named `notiflex-platform`. The finished platform (its structure, manifests, and the architecture decisions the AI agents recorded) is published here:

- **Finished platform:** https://github.com/sysnet4admin/notiflex-platform

It is worth a look on its own: the same guardrails were run by three different AI agents (Claude, Codex, Gemini), and each agent's output is preserved on its own branch for comparison.

---

## Author

- [Hoon Jo (조 훈)](https://github.com/sysnet4admin)

The book (in Korean) is available at [Kyobo](https://product.kyobobook.co.kr/detail/S000220220936), [Yes24](https://link.yes24.com/a/Ldoo2neRav), and [Aladin](https://www.aladin.co.kr/shop/wproduct.aspx?ISBN=9791140719174). Errata are published under [Releases](../../releases).
