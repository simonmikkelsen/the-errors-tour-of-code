import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

const ProductList = ({ category }) => {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchProducts = async () => {
      try {
        const response = await axios.get(`/api/products/?category=${category}`);
        setProducts(response.data);
        setLoading(false);
      } catch (error) {
        console.error('Error fetching products:', error);
        setError('Failed to load products.');
        setLoading(false);
      }
    };

    fetchProducts();
  }, [category]);

  if (loading) {
    return <p>Loading products...</p>;
  }

  if (error) {
    return <p style={{ color: 'red' }}>{error}</p>;
  }

  return (
    <div className="product-list">
      <h2>{category} Products</h2>
      <div className="product-grid">
        {products.map((product) => (
          <div className="product-item" key={product.id}>
            <img
              src={product.image}
              alt={product.title}
              style={{ width: '100%', height: '150px', objectFit: 'cover' }}
            />
            <h3>{product.title}</h3>
            <p>{product.price}</p>
            <p>{product.description.substring(0, 100)}...</p>
            <Link to={`/product/${product.id}`} className="button">
              View Product
            </Link>
          </div>
        ))}
      </div>
    </div>
  );
};

export default ProductList;