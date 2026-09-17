-- ============================================
-- MODULE: LOANS
-- Purpose: Loan accounts, terms, and repayment tracking
-- ============================================

CREATE TABLE loans (
    loan_id             SERIAL PRIMARY KEY,
    loan_number         VARCHAR(30)   NOT NULL UNIQUE,
    customer_id         INTEGER       NOT NULL REFERENCES customers(customer_id),
    account_id          INTEGER       NOT NULL REFERENCES accounts(account_id),
    branch_id           INTEGER       NOT NULL REFERENCES branches(branch_id),
    loan_type           VARCHAR(20)   NOT NULL
                         CHECK (loan_type IN ('PERSONAL', 'HOME', 'AUTO', 'BUSINESS', 'EDUCATION')),
    principal_amount    NUMERIC(18,2) NOT NULL CHECK (principal_amount > 0),
    interest_rate       NUMERIC(6,4)  NOT NULL CHECK (interest_rate >= 0),
    term_months         INTEGER       NOT NULL CHECK (term_months > 0),
    outstanding_balance NUMERIC(18,2) NOT NULL,
    monthly_installment NUMERIC(18,2) NOT NULL,
    loan_status         VARCHAR(20)   NOT NULL DEFAULT 'ACTIVE'
                         CHECK (loan_status IN ('PENDING', 'ACTIVE', 'CLOSED', 'DEFAULTED', 'WRITTEN_OFF')),
    probability_of_default NUMERIC(5,4) CHECK (probability_of_default BETWEEN 0 AND 1),
    disbursed_at        TIMESTAMPTZ,
    matures_at          DATE,
    created_at          TIMESTAMPTZ   NOT NULL DEFAULT now(),
    updated_at          TIMESTAMPTZ   NOT NULL DEFAULT now()
);

CREATE INDEX idx_loans_customer ON loans(customer_id);
CREATE INDEX idx_loans_account ON loans(account_id);
CREATE INDEX idx_loans_status ON loans(loan_status);
CREATE INDEX idx_loans_type ON loans(loan_type);