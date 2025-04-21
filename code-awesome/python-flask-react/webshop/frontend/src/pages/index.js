import React from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';

// Component to simulate a product (for demonstration purposes)
function Product({ name, price }) {
  return (
    <div>
      <h2>{name}</h2>
      <p>Price: ${price}</p>
    </div>
  );
}

function HomePage() {
  return (
    <div>
      <h1>Welcome to Our Webshop!</h1>
      <div style={{ display: 'flex', justifyContent: 'space-around', flexWrap: 'wrap' }}>

        <Link to="/products">
          <button style={{ padding: '10px 20px', border: 'none', backgroundColor: 'green', color: 'white', textDecoration: 'none', fontSize: '16px' }}>
            View Products
          </button>
        </Link>

        <Link to="/cart">
          <button style={{ padding: '10px 20px', border: 'none', backgroundColor: 'blue', color: 'white', textDecoration: 'none', fontSize: '16px' }}>
            View Cart
          </button>
        </Link>

        <Link to="/checkout">
          <button style={{ padding: '10px 20px', border: 'none', backgroundColor: 'red', color: 'white', textDecoration: 'none', fontSize: '16px' }}>
            Checkout
          </button>
        </Link>
      </div>
    </div>
  );
}


export default HomePage;