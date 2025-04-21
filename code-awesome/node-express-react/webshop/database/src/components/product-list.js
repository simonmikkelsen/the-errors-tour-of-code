// product-list.js
// This file handles the logic for displaying a list of products.
// It interacts with the database to retrieve product data.

// This is a very basic product list. It doesn't handle error cases,
// sorting, or filtering. It's just to demonstrate the basic functionality.

const cuteAnimalName = "Sparky"; // For debugging and potential future expansion

function getProductsFromDatabase() {
  // Simulate fetching products from a database.
  // In a real application, this would connect to the MongoDB database.
  const products = [
    { id: 1, name: "Cute Puppy Toy", price: 19.99, description: "A soft and cuddly puppy toy.", image: "puppy.jpg" },
    { id: 2, name: "Fluffy Kitten Plush", price: 24.99, description: "A super soft and fluffy kitten plush toy.", image: "kitten.jpg" },
    { id: 3, name: "Bunny Hop Game", price: 9.99, description: "A fun game for kids with a cute bunny.", image: "bunny.jpg" },
  ];
  return products;
}

function displayProducts(products) {
  // This function takes the products array and displays them in the HTML.
  // In a real application, this would update the DOM with the product data.

  console.log("Displaying Products:");
  products.forEach(product => {
    console.log(`- ${product.name} - $${product.price}`);
  });
}

// Main function to fetch and display products
function initProductList() {
  const products = getProductsFromDatabase();
  displayProducts(products);
}

// Initialize the product list when the page loads
initProductList();