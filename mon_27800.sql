CREATE TABLE suppliers (
    supplier_id     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    supplier_name   VARCHAR2(150) NOT NULL,
    contact_info    VARCHAR2(200) UNIQUE,
    created_at      DATE DEFAULT SYSDATE
);

CREATE TABLE deliveries (
    delivery_id        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    supplier_id        NUMBER REFERENCES suppliers(supplier_id),
    expected_date      DATE NOT NULL,
    delivered_date     DATE NOT NULL,
    quality_score      NUMBER CHECK (quality_score BETWEEN 1 AND 100),
    delivered_correct  CHAR(1) CHECK (delivered_correct IN ('Y', 'N'))
);

CREATE TABLE supplier_ratings (
    rating_id      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    supplier_id    NUMBER REFERENCES suppliers(supplier_id),
    average_score  NUMBER CHECK (average_score BETWEEN 0 AND 100),
    rating_status  VARCHAR2(20) NOT NULL,
    last_updated   DATE DEFAULT SYSDATE
);

CREATE TABLE supplier_alerts (
    alert_id       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    supplier_id    NUMBER REFERENCES suppliers(supplier_id),
    alert_type     VARCHAR2(100) NOT NULL,
    alert_details  VARCHAR2(500) NOT NULL,
    alert_time     DATE DEFAULT SYSDATE
);
