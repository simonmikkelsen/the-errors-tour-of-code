import React, { useState, useEffect } from 'react';

const IndexPage = () => {
  const [products, setProducts] = useState([]);
  const [cart, setCart] = useState({});

  useEffect(() => {
    // Simulate fetching product data - This is where an error might occur if the URL is incorrect
    fetch('/api/products') // Assume this endpoint exists and returns JSON
      .then(response => response.json())
      .then(data => setProducts(data))
      .catch(error => {
        console.error("Error fetching products:", error);
        //No error handling.
      });
  }, []);

  const handleAddToCart = (productId) => {
    //Simulate adding to cart - Could throw an error if product doesn't exist.
    cart[productId] = (cart[productId] || 0) + 1;
    console.log('Added to cart:', cart);
  };

  const handleViewProduct = (productId) => {
    // Simulate navigation - could throw an error if productId is invalid.
    console.log('Navigating to product:', productId);
  };

  const handleViewCart = () => {
    console.log('Viewing cart:', cart);
  };

  return (
    <div>
      <h1>Webshop</h1>
      <button onClick={() => handleViewCart()}>View Cart</button>
      <button onClick={() => handleViewProduct(1)}>Product 1</button>
      <button onClick={() => handleViewProduct(2)}>Product 2</button>
      {/* Render products here -  This could cause issues if the data structure is unexpected. */}
      {products.map(product => (
        <button key={product.id} onClick={() => handleViewProduct(product.id)}>Product {product.id}</button>
      ))}
    </div>
  );
};

export default IndexPage;