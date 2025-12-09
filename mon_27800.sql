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
    rating_id       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    supplier_id     NUMBER REFERENCES suppliers(supplier_id),
    average_score   NUMBER CHECK (average_score BETWEEN 0 AND 100),
    rating_status   VARCHAR2(20),
    last_updated    DATE
);


CREATE TABLE supplier_alerts (
    alert_id       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    supplier_id    NUMBER REFERENCES suppliers(supplier_id),
    alert_type     VARCHAR2(100) NOT NULL,
    alert_details  VARCHAR2(500) NOT NULL,
    alert_time     DATE DEFAULT SYSDATE
);

INSERT INTO supplier_ratings (supplier_id, average_score, rating_status, last_updated)
VALUES (1, 92, 'GOOD', SYSDATE);
INSERT INTO supplier_ratings (supplier_id, average_score, rating_status, last_updated)
VALUES (2, 85, 'AVERAGE', SYSDATE);
INSERT INTO supplier_ratings (supplier_id, average_score, rating_status, last_updated)
VALUES (3, 78, 'BELOW AVERAGE', SYSDATE);
INSERT INTO supplier_ratings (supplier_id, average_score, rating_status, last_updated)
VALUES (4, 88, 'GOOD', SYSDATE);

INSERT INTO suppliers (supplier_name, contact_info)
VALUES ('Alpha Logistics', 'alpha.log@suppliers.com | 0789001122');
INSERT INTO suppliers (supplier_name, contact_info)
VALUES ('Silver Supplies', 'silver.sup@suppliers.com | 0789112244');
INSERT INTO suppliers (supplier_name, contact_info)
VALUES ('Green Leaf Traders', 'green.traders@suppliers.com | 0789445566');
INSERT INTO suppliers (supplier_name, contact_info)
VALUES ('Sunrise Distributors', 'sunrise.dist@suppliers.com | 0789332211');

INSERT INTO deliveries (supplier_id, expected_date, delivered_date, quality_score, delivered_correct)
VALUES (1, DATE '2025-01-05', DATE '2025-01-05', 92, 'Y');
INSERT INTO deliveries (supplier_id, expected_date, delivered_date, quality_score, delivered_correct)
VALUES (2, DATE '2025-01-10', DATE '2025-01-12', 78, 'N');
INSERT INTO deliveries (supplier_id, expected_date, delivered_date, quality_score, delivered_correct)
VALUES (3, DATE '2025-01-03', DATE '2025-01-03', 88, 'Y');
INSERT INTO deliveries (supplier_id, expected_date, delivered_date, quality_score, delivered_correct)
VALUES (4, DATE '2025-01-07', DATE '2025-01-07', 85, 'Y');

INSERT INTO supplier_alerts (supplier_id, alert_type, alert_details, alert_time)
VALUES (2, 'LOW PERFORMANCE', 'Supplier score dropped below threshold.', SYSDATE);
INSERT INTO supplier_alerts (supplier_id, alert_type, alert_details, alert_time)
VALUES (1, 'QUALITY WARNING', 'Repeated low quality deliveries.', SYSDATE);
INSERT INTO supplier_alerts (supplier_id, alert_type, alert_details, alert_time)
VALUES (3, 'DELAY ISSUE', 'Multiple late deliveries recorded.', SYSDATE);
INSERT INTO supplier_alerts (supplier_id, alert_type, alert_details, alert_time)
VALUES (4, 'GOOD PERFORMANCE', 'Supplier performance improving.', SYSDATE);
