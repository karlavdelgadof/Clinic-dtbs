/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
    id BIGSERIAL NOT NULL PRIMARY KEY, /* For PostgreSQL version purposes I'll be implementing this sequential type instead of IDENTITY(1,1); */
    name VARCHAR(100),
    date_of_birth DATE NOT NULL,
);

/* Create new medical_histories table */
CREATE TABLE medical_histories (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT FOREIGN KEY REFERENCES patients(id),
    status VARCHAR(50)
);

/* Create new invoices table */
CREATE TABLE invoices (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
);

/* Create new treatments table */
CREATE TABLE treatments (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    type VARCHAR(100),
    name VARCHAR(100)
);

/* Create new invoice_items table */
CREATE TABLE invoice_items (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    unit_price DECIMAL NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL NOT NULL,
    invoice_id INT FOREIGN KEY REFERENCES invoices(id),
    treatment_id INT FOREIGN KEY REFERENCES treatments(id)
);



