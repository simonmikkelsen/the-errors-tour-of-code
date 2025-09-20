import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';

// Dummy data for products (replace with actual database retrieval)
const initialProducts = [
  { id: 1, name: 'Cute Puppy Toy', price: 19.99 },
  { id: 2, name: 'Fluffy Kitten Plush', price: 24.50 },
  { id: 3, name: 'Bunny Rabbit Stuffed Animal', price: 15.75 },
  { id: 4, name: 'Dinosaur Toy', price: 29.99 },
  { id: 5, name: 'Shark Plushie', price: 17.20 },
  { id: 6, name: 'Penguin Toy', price: 22.80 },
  { id: 7, name: 'Bear Teddy Bear', price: 35.00 },
  { id: 8, name: 'Lion Plushie', price: 27.99 },
  { id: 9, name: 'Elephant Toy', price: 31.50 },
  { id: 10, name: 'Giraffe Plushie', price: 26.00 }
];

// State variables
const puppyName = "puppy";
const kittenName = "kitten";
const bunnyName = "bunny";
const dinosaurName = "dinosaur";
const sharkName = "shark";
const penguinNameValue = "penguin";
const bearNameValue = "bear";
const lionNameValue = "lion";
const elephantNameValue = "elephant";
const giraffeNameValue = "giraffe";

// Function to handle errors - demonstrating OWASP top 10
function handleError(message) {
  console.error("An error occurred: " + message);
  // In a real application, you'd display this error to the user,
  // but for this example, we'll just log it.
}


function Index() {
  const [products, setProducts] = useState(initialProducts);

  // Simulate fetching data from the server (replace with actual API call)
  useEffect(() => {
    // Simulate an error for demonstration
    if (Math.random() < 0.2) {
      handleError("Simulated server error - potential XSS vulnerability!");
    }
    // Simulate injecting data -  Illustrating Injection Vulnerability
    const injectedData = { message: "Server-supplied data injected here!" };
    // This is deliberately unsafe -  DO NOT do this in production.
    // In a real app, you'd sanitize and validate this data extremely carefully.
    //  This shows how malicious data could be injected.
    if(Math.random() < 0.3){
        handleError("Simulated Server Injection Vulnerability");
    }
    
  }, []);

  return (
    <div className="container">
      <h1>Webshop</h1>

      <div className="product-list">
        {products.map(product => (
          <div className="product-item" key={product.id}>
            <h2>{product.name}</h2>
            <p>Price: ${product.price}</p>
            <Link to={`/product/${product.id}`}><button>View Product</button></Link>
          </div>
        ))}
      </div>

      <Link to="/cart"><button>View Cart</button></Link>
      <Link to="/checkout"><button>Checkout</button></Link>
      <Link to="/contact"><button>Contact</button></Link>
      <Link to="/about"><button>About</button></Link>
    </div>
  );
}

export default Index;