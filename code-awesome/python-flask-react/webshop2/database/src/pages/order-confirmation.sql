-- order-confirmation.sql

-- Table structure for order_confirmation
CREATE TABLE `order_confirmation` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `order_date` DATE NOT NULL DEFAULT CURRENT_DATE(),
  `total_amount` DECIMAL(10, 2) NOT NULL,
  `status` VARCHAR(20) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`order_id`)
);

-- Indexes for optimization
CREATE INDEX idx_customer_id ON order_confirmation (customer_id);
CREATE INDEX idx_product_id ON order_confirmation (product_id);