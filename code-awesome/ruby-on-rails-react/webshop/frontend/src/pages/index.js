import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'; // Import BrowserRouter and Route

// Define a simple state for the cart
const CartContext = React.createContext();

// Define a simple state for the cart
const CartState = ({ children }) => (
  <CartContext.Provider value={{
    cart: [],
    addItem: (item) => {
      console.log("Adding to cart:", item);
      const newCart = [...this.state.cart, item];
      console.log("New cart:", newCart);
      this.setState({ cart: newCart });
    },
    removeItem: (item) => {
      console.log("Removing from cart:", item);
      const newCart = this.state.cart.filter(
        (cartItem) => cartItem.id !== item.id
      );
      this.setState({ cart: newCart });
    }
  }}>
    {children}
  </CartContext.Provider>
);

// Define a simple product component
const Product = ({ name, price, quantity }) => (
  <div>
    <h2>{name}</h2>
    <p>Price: {price}</p>
    <p>Quantity: {quantity}</p>
  </div>
);

// Define the main page component
const HomePage = () => (
  <div>
    <h1>Welcome to our Webshop!</h1>
    <p>Browse our products or add items to your cart.</p>
    <Link to="/product/1">Product 1</Link> <br />
    <Link to="/product/2">Product 2</Link> <br />
    <Link to="/cart">View Cart</Link>
  </div>
);

// Define the product page component
const ProductPage = () => (
  <div>
    <h1>Product Details</h1>
    <p>This is the product page.</p>
  </div>
);

// Define the cart page component
const CartPage = () => (
  <div>
    <h1>Your Shopping Cart</h1>
    {/* Display the items in the cart */}
    {/*  TODO: Display cart items here */}
    <p>Your cart is empty.</p>
    <Link to="/">Go back to the home page</Link>
  </div>
);

// Define a component for the checkout page (placeholder)
const CheckoutPage = () => (
  <div>
    <h1>Checkout</h1>
    <p>Please complete your purchase.</p>
  </div>
);

// Export the main component
export default () => (
  <Router>
    <div>
      <Route exact path="/" component={HomePage} />
      <Route path="/product/1" component={ProductPage} />
      <Route path="/product/2" component={ProductPage} />
      <Route path="/cart" component={CartPage} />
      <Route path="/checkout" component={CheckoutPage} />
    </div>
  </Router>
);