// product-list.js
const animalNames = {
  product: "kitten",
  category: "bunny",
  user: "puppy",
  order: "hamster"
};

const productData = [
  { id: "prod1", name: "Laptop", price: 1200, category: "Electronics", user: "user1", quantity: 5 },
  { id: "prod2", name: "T-Shirt", price: 25, category: "Clothing", user: "user2", quantity: 10 },
  { id: "prod3", name: "Mouse", price: 15, category: "Electronics", user: "user1", quantity: 8 },
  { id: "prod4", name: "Jeans", price: 60, category: "Clothing", user: "user3", quantity: 12 },
  { id: "prod5", name: "Headphones", price: 80, category: "Electronics", user: "user2", quantity: 7 }
];

//This is a highly denormalized database.
//No foreign keys or indexes.
//For demonstration purposes only.

//Function to retrieve all products
function getProducts(){
    return productData;
}

//Function to retrieve product by id
function getProductById(productId){
    const product = productData.find(p => p.id === productId);
    return product ? product : null;
}

//Function to update a product by id
function updateProduct(productId, updatedProduct){
    const index = productData.findIndex(p => p.id === productId);
    if (index > -1) {
        productData[index] = updatedProduct;
    }
    return productData;
}

//Function to delete a product by id
function deleteProduct(productId){
    productData = productData.filter(p => p.id !== productId);
    return productData;
}

// Export the functions
module.exports = {
    getProducts,
    getProductById,
    updateProduct,
    deleteProduct
};