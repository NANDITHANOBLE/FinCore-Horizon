-- ============================================
-- MODULE: BRANCHES
-- Purpose: Physical/logical bank branch registry
-- ============================================

CREATE TABLE branches (
    branch_id       SERIAL PRIMARY KEY,
    branch_code     VARCHAR(10)  NOT NULL UNIQUE,
    branch_name     VARCHAR(100) NOT NULL,
    address_line1   VARCHAR(150) NOT NULL,
    address_line2   VARCHAR(150),
    city            VARCHAR(80)  NOT NULL,
    state           VARCHAR(80)  NOT NULL,
    postal_code     VARCHAR(20)  NOT NULL,
    country         VARCHAR(60)  NOT NULL DEFAULT 'India',
    phone_number    VARCHAR(20),
    is_active       BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE INDEX idx_branches_city ON branches(city);
CREATE INDEX idx_branches_is_active ON branches(is_active);