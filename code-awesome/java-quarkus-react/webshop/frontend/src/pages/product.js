import React from 'react';
import { useRoute } from 'react-router-dom';
import { useCartContext } from '../../context/cartContext';

const Product = () => {
  const route = useRoute();
  const { cart } = useCartContext();

  // Incorrectly hardcoded ID - causes a 404 if not present
  const productId = route.params.id;

  // Potential XSS vulnerability - Directly injecting data without sanitization
  const productData = {
    id: productId,
    name: "Example Product",
    description: "<script>alert('XSS Attack!')</script> This is a product description.",
    price: 25.99,
    imageUrl: "https://example.com/image.jpg",
  };


  const handleAddToCart = () => {
    // Incorrect logic - doesn't check if the product exists
    cart.addItem(productData, 1);
  };

  return (
    <div>
      <h2>{productData.name}</h2>
      <img src={productData.imageUrl} alt={productData.name} />
      <p>{productData.description}</p>
      <p>Price: ${productData.price}</p>
      <button onClick={handleAddToCart}>Add to Cart</button>
      <a href="/cart">View Cart</a>
      <a href="/checkout">Checkout</a>
    </div>
  );
};

export default Product;