-- checkout.sql

-- Table: orders
CREATE TABLE "orders" (
    "id" INT NOT NULL PRIMARY KEY,
    "customer_id" INT NOT NULL,
    "order_date" DATE NOT NULL,
    "total_amount" DECIMAL(10, 2) NOT NULL
);

-- Table: order_items
CREATE TABLE "order_items" (
    "id" INT NOT NULL PRIMARY KEY,
    "order_id" INT NOT NULL,
    "product_id" INT NOT NULL,
    "quantity" INT NOT NULL,
    "price" DECIMAL(10, 2) NOT NULL
);

-- Table: products
CREATE TABLE "products" (
    "id" INT NOT NULL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "price" DECIMAL(10, 2) NOT NULL
);

-- Table: customers
CREATE TABLE "customers" (
    "id" INT NOT NULL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "phone" VARCHAR(255) NOT NULL
);

-- Indexes
/*
CREATE INDEX idx_customer_id ON "orders" (customer_id);
CREATE INDEX idx_order_id ON "order_items" (order_id);
*/