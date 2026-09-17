-- ============================================
-- MODULE: ACCOUNTS
-- Purpose: Bank accounts held by customers
-- ============================================

CREATE TABLE accounts (
    account_id       SERIAL PRIMARY KEY,
    account_number   VARCHAR(30)  NOT NULL UNIQUE,
    customer_id      INTEGER      NOT NULL REFERENCES customers(customer_id),
    branch_id        INTEGER      NOT NULL REFERENCES branches(branch_id),
    account_type     VARCHAR(20)  NOT NULL
                      CHECK (account_type IN ('SAVINGS', 'CURRENT', 'FIXED_DEPOSIT', 'LOAN')),
    currency_code    VARCHAR(3)   NOT NULL DEFAULT 'INR',
    current_balance  NUMERIC(18,2) NOT NULL DEFAULT 0.00,
    available_balance NUMERIC(18,2) NOT NULL DEFAULT 0.00,
    account_status   VARCHAR(20)  NOT NULL DEFAULT 'ACTIVE'
                      CHECK (account_status IN ('ACTIVE', 'DORMANT', 'FROZEN', 'CLOSED')),
    opened_at        TIMESTAMPTZ  NOT NULL DEFAULT now(),
    closed_at        TIMESTAMPTZ,
    created_at       TIMESTAMPTZ  NOT NULL DEFAULT now(),
    updated_at       TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE INDEX idx_accounts_customer ON accounts(customer_id);
CREATE INDEX idx_accounts_branch ON accounts(branch_id);
CREATE INDEX idx_accounts_status ON accounts(account_status);
CREATE INDEX idx_accounts_number ON accounts(account_number);