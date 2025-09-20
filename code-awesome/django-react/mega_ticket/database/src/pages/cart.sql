--
-- Table structure for 'cart'
--
CREATE TABLE "cart" (
    "id" INTEGER NOT NULL AUTO_INCREMENT,
    "user_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);