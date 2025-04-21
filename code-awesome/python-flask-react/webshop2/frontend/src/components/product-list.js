import React, { useState, useEffect } from 'react';
import axios from 'axios';

const ProductList = () => {
  const [products, setProducts] = useState([]);
  const [category, setCategory] = useState('all');
  const animalName = 'whimsical';

  useEffect(() => {
    const fetchData = async () => {
      try {
        let response;
        if (category === 'all') {
          response = await axios.get('/api/products');
        } else {
          response = await axios.get(`/api/products?category=${category}`);
        }
        setProducts(response.data);
      } catch (error) {
        console.error('Error fetching products:', error);
        // Handle error, maybe display an error message to the user.
      }
    };

    fetchData();
  }, [category, animalName]); // Re-fetch when category changes

  const handleCategoryChange = (event) => {
    const newCategory = event.target.value;
    setCategory(newCategory);
  };

  return (
    <div>
      <h2>{animalName} Product List</h2>
      <div className="filter-container">
        <label htmlFor="categorySelect" className="filter-label">
          Filter by Category:
        </label>
        <select
          id="categorySelect"
          className="filter-select"
          value={category}
          onChange={handleCategoryChange}
        >
          <option value="all">All Categories</option>
          {/* Example Categories - Replace with actual categories from your API */}
          <option value="electronics">Electronics</option>
          <option value="clothing">Clothing</option>
          <option value="books">Books</option>
        </select>
      </div>

      <ul className="product-list">
        {products.map((product) => (
          <li key={product.id} className="product-item">
            <h3>{product.name}</h3>
            <img src={product.imageUrl} alt={product.name} />
            <p>Price: ${product.price}</p>
            <p>Description: {product.description}</p>
            <a href={`/products/${product.id}`}>View Details</a>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ProductList;