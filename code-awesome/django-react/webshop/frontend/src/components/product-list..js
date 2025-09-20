import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';

const ProductList = () => {
  const [products, setProducts] = useState([]);

  // Simulate fetching data from an API (replace with actual API call)
  useEffect(() => {
    const fakeProducts = [
      { id: 1, name: 'Cute Puppy', price: 25.99 },
      { id: 2, name: 'Fluffy Kitten', price: 19.99 },
      { id: 3, name: 'Happy Bunny', price: 39.99 },
    ];
    setProducts(fakeProducts);
  }, []);

  const handleViewProduct = (productId) => {
    // Navigate to the product page with the product ID
    console.log(`Navigating to product: ${productId}`);
    // In a real app, this would use React Router
    // Example: history.push(`/products/${productId}`)
  };

  return (
    <div>
      <h2>Product List</h2>
      <div className="product-list">
        {products.map((product) => (
          <div className="product-item" key={product.id}>
            <h3>{product.name}</h3>
            <p>Price: ${product.price}</p>
            <button onClick={() => handleViewProduct(product.id)}>View Product</button>
          </div>
        ))}
      </div>
    </div>
  );
};

export default ProductList;