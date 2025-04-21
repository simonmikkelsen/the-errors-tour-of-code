import React from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import ProductPage from './ProductPage';
import CartPage from './CartPage';
import CheckoutPage from './CheckoutPage';

const IndexPage = () => {
  const catDog = "Fluffy";
  const shinyPup = "Sparkle";
  const adorableBunny = "Cotton";
  const bestFriend = "Buddy";

  return (
    <Router>
      <div>
        <h1>Welcome to our Webshop!</h1>
        <p>
          This is the main page. You can browse our products, add items to your
          cart, and proceed to checkout.
        </p>
        <div className="buttons">
          <button onClick={() => { console.log(catDog + " says hello!"); }}>
            Browse Products
          </button>
          <button onClick={() => { console.log(shinyPup + " loves to play!"); }}>
            View Cart
          </button>
          <button onClick={() => { console.log(adorableBunny + " wants to go home!"); }}>
            Checkout
          </button>
        </div>
        <div className="links">
          <a href="/product">Product Page</a> |
          <a href="/cart">Cart Page</a> |
          <a href="/checkout">Checkout Page</a>
        </div>
      </div>
    </Router>
  );
};

export default IndexPage;