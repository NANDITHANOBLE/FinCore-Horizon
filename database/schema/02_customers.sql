-- ============================================
-- MODULE: CUSTOMERS
-- Purpose: Core customer identity registry
-- ============================================

CREATE TABLE customers (
    customer_id     SERIAL PRIMARY KEY,
    customer_code   VARCHAR(20)  NOT NULL UNIQUE,
    first_name      VARCHAR(80)  NOT NULL,
    last_name       VARCHAR(80)  NOT NULL,
    date_of_birth   DATE         NOT NULL,
    email           VARCHAR(150) NOT NULL UNIQUE,
    phone_number    VARCHAR(20)  NOT NULL,
    national_id     VARCHAR(50)  NOT NULL UNIQUE,
    address_line1   VARCHAR(150) NOT NULL,
    address_line2   VARCHAR(150),
    city            VARCHAR(80)  NOT NULL,
    state           VARCHAR(80)  NOT NULL,
    postal_code     VARCHAR(20)  NOT NULL,
    country         VARCHAR(60)  NOT NULL DEFAULT 'India',
    risk_rating     VARCHAR(20)  NOT NULL DEFAULT 'LOW'
                     CHECK (risk_rating IN ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL')),
    kyc_verified    BOOLEAN      NOT NULL DEFAULT FALSE,
    home_branch_id  INTEGER      NOT NULL REFERENCES branches(branch_id),
    is_active       BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE INDEX idx_customers_national_id ON customers(national_id);
CREATE INDEX idx_customers_home_branch ON customers(home_branch_id);
CREATE INDEX idx_customers_risk_rating ON customers(risk_rating);
CREATE INDEX idx_customers_email ON customers(email);