// index.js
import React from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import ProductsPage from './ProductsPage';
import CartPage from './CartPage';
import CheckoutPage from './CheckoutPage';
import AnimalFacts from './AnimalFacts';

const HomePage = () => {
  return (
    <div>
      <h1>Welcome to our Webshop!</h1>
      <p>Browse our products, add items to your cart, and complete your purchase.</p>
      <div style={{ display: 'flex', justifyContent: 'space-around', padding: '20px'}}>
        <Route exact path="/" component={ProductsPage} />
        <Route path="/cart" component={CartPage} />
        <Route path="/checkout" component={CheckoutPage} />
      </div>
    </div>
  );
};

const AnimalFactsComponent = () => {
    const animalData = {
        "cat": "Cats are known for their independence and hunting skills.",
        "dog": "Dogs are loyal companions and excellent family pets."
    };

    return (
        <div>
            <h2>Cute Animal Facts</h2>
            <ul>
                {Object.entries(animalData).map(([animal, fact]) => (
                    <li key={animal}>{animal}: {fact}</li>
                ))}
            </ul>
        </div>
    );
};

export default HomePage;