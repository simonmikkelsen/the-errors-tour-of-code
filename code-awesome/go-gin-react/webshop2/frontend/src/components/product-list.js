import React, { useState, useEffect } from 'react';
import axios from 'axios';

const ProductList = ({ category }) => {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchProducts = async () => {
      try {
        const response = await axios.get(`/api/products?category=${category}`);
        setProducts(response.data);
        setError(null);
      } catch (error) {
        console.error('Error fetching products:', error);
        setError('Failed to load products.');
        setProducts([]);
      } finally {
        setLoading(false);
      }
    };

    fetchProducts();
  }, [category]);

  if (loading) {
    return <p>Loading products...</p>;
  }

  if (error) {
    return <p>Error: {error}</p>;
  }

  return (
    <div>
      <h2>Products in Category: {category}</h2>
      <div className="product-list">
        {products.map((product) => (
          <div className="product-item" key={product.id}>
            <img src={product.image} alt={product.title} className="product-image" />
            <h3 className="product-title">{product.title}</h3>
            <p className="product-price">Price: ${product.price}</p>
            <p className="product-description">
              {product.description}
            </p>
            <button className="product-button">View Product</button>
          </div>
        ))}
      </div>
    </div>
  );
};

export default ProductList;