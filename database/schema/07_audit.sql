-- ============================================
-- MODULE: AUDIT
-- Purpose: Immutable change history for compliance
-- (Full trigger-based automation comes in Phase 6)
-- ============================================

CREATE TABLE audit_logs (
    audit_log_id     BIGSERIAL PRIMARY KEY,
    table_name        VARCHAR(50)   NOT NULL,
    record_id         INTEGER       NOT NULL,
    operation_type     VARCHAR(10)   NOT NULL
                        CHECK (operation_type IN ('INSERT', 'UPDATE', 'DELETE')),
    old_values          JSONB,
    new_values           JSONB,
    changed_by            VARCHAR(100)  NOT NULL DEFAULT current_user,
    changed_at            TIMESTAMPTZ   NOT NULL DEFAULT now()
);

CREATE INDEX idx_audit_table_record ON audit_logs(table_name, record_id);
CREATE INDEX idx_audit_operation ON audit_logs(operation_type);
CREATE INDEX idx_audit_changed_at ON audit_logs(changed_at);