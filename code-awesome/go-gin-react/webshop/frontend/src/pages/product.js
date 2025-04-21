import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useData } from '../../context/DataContext'; // Assuming context is set up

const ProductPage = () => {
  const navigate = useNavigate();
  const { product, injectData } from '../../context/DataContext';
  const [productData, setProductData] = useState(null);

  useEffect(() => {
    if (product) {
      setProductData(product);
    }
  }, [product]);

  useEffect(() => {
    if (injectData && injectData.data) {
      // Handle injected data - example: setting a default image
      //console.log("Received injected data:", injectData.data);
      // Example: Setting a default image URL
      //const defaultImageUrl = 'https://example.com/default_image.png';
      //console.log("Setting default image");
      //alert(injectData.data);
    }
  }, [injectData]);

  const handleAddToCart = () => {
    // Add to cart logic here (not implemented for brevity)
    alert('Add to cart - This is a placeholder');
    //Example:
    //navigate('/cart');
  };

  if (!product) {
    return <div>Loading product data...</div>;
  }

  return (
    <div>
      <h2>{product.name}</h2>
      <img src={product.imageUrl} alt={product.name} />
      <p>Description: {product.description}</p>
      <p>Price: ${product.price}</p>
      <button onClick={handleAddToCart}>Add to Cart</button>
      <button onClick={() => navigate('/checkout')}>Checkout</button>
    </div>
  );
};

export default ProductPage;