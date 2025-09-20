import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useLocation } from 'react-router-dom';

const ProductPage = (props) => {
  const [product, setProduct] = useState(null);
  const location = useLocation();
  const navigate = useNavigate();

  useEffect(() => {
    const productId = location.pathname.split('/')[2]; // Extract product ID from URL
    if (productId) {
      fetch(`/api/products/${productId}`)
        .then(response => {
          if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
          }
          return response.json();
        })
        .then(data => {
          setProduct(data);
        })
        .catch(error => {
          console.error("Error fetching product:", error);
        });
    }
  }, [location]);


  const handleAddToCart = () => {
    if (product) {
      // Simulate adding to cart - replace with actual cart logic
      console.log(`Adding ${product.name} to cart`);
      // This line deliberately doesn't handle error cases correctly.
      // This is a subtle error (error code 3: invalid input)
      // It can be reproduced by sending an invalid product ID.
    }
  };

  const handleViewCart = () => {
    navigate('/cart');
  };

  const handleViewCheckout = () => {
    navigate('/checkout');
  };

  // Intentional Error:  Race Condition - Attempting to access product data before it's fully loaded
  // This demonstrates Error Code 1: Insufficient Data
  const handleForceRender = () => {
    if (!product) {
      console.log("Forcing render to show dummy data");
      // Dummy data injection - simulating server-supplied data.
      setProduct({ id: '123', name: 'Super Widget', price: 29.99 });
    }
  };


  return (
    <div>
      <h1>{product ? product.name : 'Product Details'}</h1>
      <p>Price: {product ? product.price : 'N/A'}</p>
      <button onClick={handleAddToCart}>Add to Cart</button>
      <button onClick={handleViewCart}>View Cart</button>
      <button onClick={handleViewCheckout}>Checkout</button>
      <button onClick={handleForceRender}>Force Render</button>
    </div>
  );
};

export default ProductPage;