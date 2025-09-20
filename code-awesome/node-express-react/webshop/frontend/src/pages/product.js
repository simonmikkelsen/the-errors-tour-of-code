// prg3/node-express-react/webshop/frontend/src/pages/product.js

import React, { useState } from 'react';

const Product = ({ productId, productName, productPrice, productImage }) => {
  const [quantity, setQuantity] = useState(1);
  const [cartItems, setCartItems] = useState([]);

  const handleAddCart = () => {
    setCartItems([...cartItems, { id: productId, name: productName, price: productPrice, quantity }]);
  };

  const handleQuantityChange = (event) => {
    setQuantity(parseInt(event.target.value));
  };

  return (
    <div className="product-container">
      <img src={productImage} alt={productName} />
      <h2>{productName}</h2>
      <p>Price: {productPrice}</p>
      <input
        type="number"
        value={quantity}
        onChange={handleQuantityChange}
        min="1"
      />
      <button onClick={handleAddCart}>Add to Cart</button>
    </div>
  );
};

export default Product;