-- ============================================
-- MODULE: FRAUD
-- Purpose: Fraud case tracking and flagged relationships
-- (Full graph detection logic comes in Phase 8)
-- ============================================

CREATE TABLE fraud_cases (
    fraud_case_id      SERIAL PRIMARY KEY,
    case_reference      VARCHAR(30)   NOT NULL UNIQUE,
    customer_id          INTEGER       NOT NULL REFERENCES customers(customer_id),
    account_id           INTEGER       REFERENCES accounts(account_id),
    fraud_type           VARCHAR(30)   NOT NULL
                          CHECK (fraud_type IN ('SMURFING', 'CIRCULAR_ROUTING', 'IDENTITY_THEFT', 'ACCOUNT_TAKEOVER', 'OTHER')),
    severity              VARCHAR(20)   NOT NULL DEFAULT 'MEDIUM'
                          CHECK (severity IN ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL')),
    case_status           VARCHAR(20)   NOT NULL DEFAULT 'OPEN'
                          CHECK (case_status IN ('OPEN', 'UNDER_REVIEW', 'CONFIRMED', 'DISMISSED', 'CLOSED')),
    detected_at           TIMESTAMPTZ   NOT NULL DEFAULT now(),
    resolved_at           TIMESTAMPTZ,
    detection_method      VARCHAR(50),
    notes                 TEXT,
    created_at            TIMESTAMPTZ   NOT NULL DEFAULT now(),
    updated_at            TIMESTAMPTZ   NOT NULL DEFAULT now()
);

CREATE TABLE fraud_flagged_transactions (
    flagged_id        SERIAL PRIMARY KEY,
    fraud_case_id      INTEGER       NOT NULL REFERENCES fraud_cases(fraud_case_id),
    ledger_entry_id     BIGINT        NOT NULL REFERENCES ledger_entries(ledger_entry_id),
    flag_reason         VARCHAR(100)  NOT NULL,
    flagged_at          TIMESTAMPTZ   NOT NULL DEFAULT now()
);

CREATE INDEX idx_fraud_customer ON fraud_cases(customer_id);
CREATE INDEX idx_fraud_status ON fraud_cases(case_status);
CREATE INDEX idx_fraud_type ON fraud_cases(fraud_type);
CREATE INDEX idx_flagged_case ON fraud_flagged_transactions(fraud_case_id);
CREATE INDEX idx_flagged_ledger ON fraud_flagged_transactions(ledger_entry_id);