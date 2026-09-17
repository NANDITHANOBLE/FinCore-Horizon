-- ============================================
-- MODULE: LEDGER
-- Purpose: Immutable double-entry transaction ledger
-- (Full event-sourcing implementation comes in Phase 4)
-- ============================================

CREATE TABLE ledger_entries (
    ledger_entry_id   BIGSERIAL PRIMARY KEY,
    transaction_id    UUID          NOT NULL,
    account_id        INTEGER       NOT NULL REFERENCES accounts(account_id),
    entry_type        VARCHAR(10)   NOT NULL
                       CHECK (entry_type IN ('DEBIT', 'CREDIT')),
    amount            NUMERIC(18,2) NOT NULL CHECK (amount > 0),
    currency_code     VARCHAR(3)    NOT NULL DEFAULT 'INR',
    running_balance   NUMERIC(18,2) NOT NULL,
    description       VARCHAR(255),
    reference_type    VARCHAR(30),
    reference_id      INTEGER,
    posted_at         TIMESTAMPTZ   NOT NULL DEFAULT now(),
    created_at        TIMESTAMPTZ   NOT NULL DEFAULT now()
);

CREATE INDEX idx_ledger_transaction ON ledger_entries(transaction_id);
CREATE INDEX idx_ledger_account ON ledger_entries(account_id);
CREATE INDEX idx_ledger_posted_at ON ledger_entries(posted_at);
CREATE INDEX idx_ledger_entry_type ON ledger_entries(entry_type);