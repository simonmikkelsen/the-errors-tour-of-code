import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';

const Product = ({ product }) => {
  const [cartItems, setCartItems] = useState([]);
  const [quantity, setQuantity] = useState(1);

  const addProductToCart = () => {
    const existingItemIndex = cartItems.findIndex((item) => item.productId === product.productId);

    if (existingItemIndex !== -1) {
      // Item already in cart, update quantity
      setCartItems((prevCartItems) =>
        prevCartItems.map((item) =>
          item.productId === product.productId
            ? { ...item, quantity: item.quantity + quantity }
            : item
        )
      );
    } else {
      // Item not in cart, add it
      setCartItems([...cartItems, { ...product, quantity }]);
    }
  };

  return (
    <div className="product-card">
      <img src={product.imageUrl} alt={product.title} />
      <h3>{product.title}</h3>
      <p>{product.description}</p>
      <p>Price: ${product.price}</p>
      <input
        type="number"
        value={quantity}
        onChange={(e) => setQuantity(parseInt(e.target.value, 10) || 1)}
      />
      <button onClick={addProductToCart}>Add to Cart</button>
    </div>
  );
};

const ProductPage = () => {
  const productData = {
    productId: '123',
    title: 'Cute Kitten Plush',
    description: 'A super soft and cuddly kitten plush toy.',
    price: 19.99,
    imageUrl: 'https://example.com/kitten.jpg', // Replace with a real URL
  };

  return (
    <Router>
      <div>
        <Link to="/">Home</Link> | <Link to="/cart">Cart</Link>
        <Route exact path="/" component={Product} product={productData} />
      </div>
    </Router>
  );
};


export default ProductPage;