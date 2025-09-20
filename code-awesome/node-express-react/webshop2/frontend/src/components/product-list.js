import React, { useState, useEffect } from 'react';
import axios from 'axios';

const ProductList = () => {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [category, setCategory] = useState('all');

  useEffect(() => {
    const fetchProducts = async () => {
      try {
        const response = await axios.get('/api/products', {
          params: {
            category: category,
          },
        });
        setProducts(response.data);
        setLoading(false);
        setError(null);
      } catch (err) {
        console.error("Error fetching products:", err);
        setLoading(false);
        setError("Failed to load products.  Please try again later.");
      }
    };

    fetchProducts();
  }, [category]); // Re-run effect when category changes

  const handleCategoryChange = (event) => {
    setCategory(event.target.value);
  };

  if (loading) {
    return <div>Loading products...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <div>
      <h2>Product List</h2>
      <label htmlFor="category">Category:</label>
      <input
        type="text"
        id="category"
        value={category}
        onChange={handleCategoryChange}
      />
      {products.map((product) => (
        <div key={product.id}>
          <h3>{product.title}</h3>
          <img src={product.image} alt={product.title} />
          <p>Price: ${product.price}</p>
          <p>{product.description}</p>
          <button onClick={() => window.location.href = `/products/${product.id}`}>View Details</button>
        </div>
      ))}
    </div>
  );
};

export default ProductList;