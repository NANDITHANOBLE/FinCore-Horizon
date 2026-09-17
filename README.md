# FinCore Horizon

**Bi-Temporal Event-Driven Core Banking & Graph Intelligence Platform**

## Overview
FinCore Horizon is an enterprise-grade simulation of a core banking platform featuring:
- Immutable double-entry ledger with event sourcing
- Bi-temporal accounting (valid-time + system-time correction tracking)
- Graph-based AML/fraud ring detection (recursive CTEs)
- Monte Carlo credit risk & stress testing engine
- FastAPI backend with JWT/RBAC security and Redis idempotency
- CDC event pipeline (Redis + RabbitMQ + Celery)
- Streamlit executive intelligence dashboard
- Full Docker/CI-CD deployment pipeline

## Tech Stack
Python 3.12 · FastAPI · PostgreSQL · SQLAlchemy 2.0 · Redis · RabbitMQ · Celery ·
Streamlit · Plotly · NumPy/SciPy · Docker · GitHub Actions

## Project Phases

| Phase | Name | Status |
|---|---|---|
| 0 | Project Setup & Environment | ✅ Complete |
| 1 | Database Foundation | ⬜ Not Started |
| 2 | Schema Implementation | ⬜ Not Started |
| 3 | Data Seeding | ⬜ Not Started |
| 4 | Ledger Engine | ⬜ Not Started |
| 5 | Bi-Temporal Accounting | ⬜ Not Started |
| 6 | Audit Framework | ⬜ Not Started |
| 7 | CDC Event Pipeline | ⬜ Not Started |
| 8 | AML Fraud Engine | ⬜ Not Started |
| 9 | Credit Risk Engine | ⬜ Not Started |
| 10 | FastAPI Backend | ⬜ Not Started |
| 11 | Security & Idempotency | ⬜ Not Started |
| 12 | Executive Dashboard | ⬜ Not Started |
| 13 | Testing & Performance | ⬜ Not Started |
| 14 | Dockerization & Deployment | ⬜ Not Started |

## Getting Started
\`\`\`bash
python -m venv venv
venv\Scripts\Activate.ps1   # Windows PowerShell
pip install -r requirements.txt
\`\`\`

## Environment Notes
- Requires **Python 3.12** (Python 3.14 currently lacks pre-built wheels for numpy/scipy/pillow/pydantic-core on Windows)
- Database driver: `psycopg` (v3), not legacy `psycopg2`

## Branching Strategy
\`\`\`
main       → protected, production-ready
develop    → integration branch, all phase work merges here
feature/*  → one branch per phase (e.g., feature/phase-1-database-foundation)
\`\`\`

## License
Internal / Educational Use.