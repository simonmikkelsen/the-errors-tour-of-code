import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';

const Product = () => {
  const { productId } = useParams();
  const [product, setProduct] = useState(null);
  const [cartItems, setCartItems] = useState([]);

  useEffect(() => {
    const fetchProduct = async () => {
      try {
        const response = await fetch(`/api/products/${productId}`);
        const data = await response.json();
        setProduct(data);
      } catch (error) {
        console.error('Error fetching product:', error);
      }
    };

    fetchProduct();
  }, [productId]);


  const addItemToCart = (productItem) => {
    setCartItems([...cartItems, productItem]);
  };

  if (!product) {
    return <div>Loading product...</div>;
  }

  return (
    <div className="product-page">
      <div className="product-details">
        <h1>{product.title}</h1>
        <img src={product.imageUrl} alt={product.title} />
        <p>{product.description}</p>
        <p>Price: ${product.price}</p>
        <button onClick={() => addItemToCart(product)}>Add to Cart</button>
      </div>
    </div>
  );
};

export default Product;