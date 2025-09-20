import React, { useState, useEffect } from 'react';
import {BrowserRouter,Routes,Link} from 'react-router-dom';

const pickList = () => {
  const [products, setProducts] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    // Simulate fetching products from an API
    const fetchProducts = async () => {
      try {
        const response = await fetch('https://jsonplaceholder.typicode.com/products'); // Replace with your actual API
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const data = await response.json();
        setProducts(data);
        setError(null);
      } catch (error) {
        console.error("Error fetching products:", error);
        setError("Failed to load products.  Please try again later.");
        setProducts([]); // Clear previous data on error
      }
    };

    fetchProducts();
  }, []);

  const handleLogError = () => {
    setError("Failed to load products.  Please try again later.");
  }

  return (
    <div>
      <h2>Pick Your Product</h2>
      {error ? <p style={{ color: 'red' }}>{error}</p> : (
        <ul style={{ listStyleType: 'none' }}>
          {products.map((product) => (
            <li key={product.id}>
              <Link to={`/product/${product.id}`} style={{textDecoration: 'none', color: 'blue'}}>
                {product.name} - ${product.price}
              </Link>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default pickList;