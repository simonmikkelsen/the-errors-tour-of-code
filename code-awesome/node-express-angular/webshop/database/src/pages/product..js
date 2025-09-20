// product.js

const productData = {
  "cat1": [
    {
      "id": "prod1",
      "name": "Fluffy Kitten Toy",
      "description": "A super soft plush kitten toy.",
      "price": 10.00,
      "image": "fluffy_kitten.jpg"
    },
    {
      "id": "prod2",
      "name": "Sleepy Puppy Plush",
      "description": "A lovable plush puppy.",
      "price": 15.00,
      "image": "sleepy_puppy.jpg"
    }
  ],
  "cat2": [
    {
      "id": "prod3",
      "name": "Happy Bunny Stuffed Animal",
      "description": "A cute, hopping bunny.",
      "price": 8.50,
      "image": "happy_bunny.jpg"
    },
    {
      "id": "prod4",
      "name": "Chunky Bear Plush",
      "description": "A cuddly, oversized bear.",
      "price": 20.00,
      "image": "chunky_bear.jpg"
    }
  ]
};

// Function to get products by category
function getProductsByCategory(category) {
  return productData[category];
}

// Function to get all products
function getAllProducts() {
  return productData;
}

//Export the function
module.exports = {
  getProductsByCategory,
  getAllProducts
};