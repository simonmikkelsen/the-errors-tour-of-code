import React, { useEffect, useState } from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';

// Define a simple product interface
const Product = ({ product }) => (
  <div style={{ border: '1px solid gray', padding: '10px', margin: '10px', width: '200px' }}>
    <h3>{product.name}</h3>
    <p>{product.description}</p>
    <p>Price: ${product.price}</p>
  </div>
);

// Component for the main page
const HomePage = () => {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    // Simulate fetching products from a database
    const fetchData = async () => {
      const data = [
        { id: 1, name: 'Cute Kitten Toy', description: 'A soft toy for your little one', price: 19.99 },
        { id: 2, name: 'Fluffy Bunny Plush', description: 'A cuddly plushie', price: 24.99 },
        { id: 3, name: 'Squirrel Squeaky Toy', description: 'A fun squeaky toy for squirrels', price: 9.99 },
        { id: 4, name: 'Penguin Stuffed Animal', description: 'A charming penguin plushie', price: 14.99 },
        { id: 5, name: 'Golden Retriever Plush', description: 'A realistic golden retriever plushie', price: 29.99 },
        { id: 6, name: 'Lion Stuffed Animal', description: 'A majestic lion plushie', price: 34.99 },
        { id: 7, name: 'Elephant Plush', description: 'A gentle elephant plushie', price: 39.99 },
        { id: 8, name: 'Giraffe Plush', description: 'A tall giraffe plushie', price: 44.99 },
        { id: 9, name: 'Zebra Plush', description: 'A striking zebra plushie', price: 49.99 },
        { id: 10, name: 'Shark Stuffed Animal', description: 'A fin-tastic shark plushie', price: 54.99 },
      ];
      setProducts(data);
    };

    fetchData();
  }, []);

  return (
    <div>
      <h1>Welcome to Our Webshop!</h1>
      <h2>Featured Products:</h2>
      <div style={{ display: 'flex', flexWrap: 'wrap' }}>
        {products.map((product) => (
          <div key={product.id}>
            <Product product={product} />
          </div>
        ))}
      </div>
      <Link to="/product">View All Products</Link> |
      <Link to="/cart">View Cart</Link> |
      <Link to="/checkout">Checkout</Link> |
      <Link to="/contact">Contact Us</Link> |
      <Link to="/about">About Us</Link>
    </div>
  );
};

export default HomePage;