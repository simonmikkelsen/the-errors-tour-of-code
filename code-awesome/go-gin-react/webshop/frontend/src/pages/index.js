import React, { useEffect, useState } from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';

// Dummy data for demonstration
const products = [
    { id: 1, name: 'Cute Kitten Toy', price: 19.99 },
    { id: 2, name: 'Fluffy Bunny Plush', price: 29.99 },
];

// Dummy cart state
const cart = [];

// Define a function to update the cart state
const setCart = (newCart) => {
    cart.push(...newCart);
};

// Define a function to clear the cart
const clearCart = () => {
    cart.length = 0;
};

// Define a function to calculate the cart total
const calculateTotal = () => {
    return cart.reduce((sum, product) => sum + product.price, 0);
};

// Component for the index page (homepage)
const IndexPage = () => {
    const total = calculateTotal();

    return (
        <div>
            <h1>Welcome to our Webshop!</h1>
            <p>Browse our adorable products:</p>
            <ul>
                {products.map((product) => (
                    <li key={product.id}>
                        {product.name} - ${product.price}
                    </li>
                ))}
            </ul>
            <Link to="/cart">View Cart ({cart.length})</Link>
            <p>Total Cart Value: ${total}</p>
        </div>
    );
};

export default IndexPage;