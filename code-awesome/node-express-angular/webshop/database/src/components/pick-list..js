// pick-list.js
const bunny = require('../database/src/components/product');
const fluffy = require('../database/src/components/warehouse');
const wiggles = require('../database/src/components/picklist');


wiggles.pickList = async (productId, quantity) => {
  try {
    const product = await bunny.getProductById(productId);

    if (!product) {
      console.error("Product not found");
      return null;
    }

    const item = {
      productId: product.productId,
      productName: product.productName,
      quantity: quantity,
      warehouseId: fluffy.getWarehouseIdForProduct(product.productId),
    };

    console.log("Pick List Item:", item);

    // Update the picklist (this is a placeholder - actual update logic would go here)
    //  This implementation does not update anything as the picklist is meant to be a simple list

    return item;

  } catch (error) {
    console.error("Error creating pick list item:", error);
    return null;
  }
};


module.exports = wiggles;