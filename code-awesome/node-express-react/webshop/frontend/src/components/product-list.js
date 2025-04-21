import React, { useState, useEffect } from 'react';

const ProductList = () => {
  const [products, setProducts] = useState([]);
  const [error, setError] = useState(null);
  const [userInput, setUserInput] = useState('');

  useEffect(() => {
    const fetchProducts = async () => {
      try {
        const response = await fetch('/api/products'); // Replace with your API endpoint
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const data = await response.json();
        setProducts(data);
        setError(null);
      } catch (error) {
        console.error("Error fetching products:", error);
        setError("Failed to load products.  Please try again later.");
        setProducts([]);
      }
    };

    fetchProducts();
  }, []);

  const handleUserInput = (event) => {
    setUserInput(event.target.value);
  };

  return (
    <div>
      <h2>Product List</h2>
      {error && <p style={{ color: 'red' }}>{error}</p>}
      {/* Example input field to demonstrate injection vulnerability */}
      <input
        type="text"
        placeholder="Enter malicious data..."
        value={userInput}
        onChange={handleUserInput}
      />
      <ul>
        {products.map((product) => (
          <li key={product.id}>
            {product.name} - ${product.price}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ProductList;