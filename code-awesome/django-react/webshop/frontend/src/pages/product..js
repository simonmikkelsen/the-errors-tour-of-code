import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useInject } from 'react-use';

const ProductPage = () => {
  const navigate = useNavigate();
  const [product, setProduct] = useState(null);
  const [errorCount, setErrorCount] = useState(0);

  useInject([{
    name: 'productData',
    deps: ['product']
  }])

  useEffect(() => {
    const fetchData = async () => {
      try {
        const data = await productData;
        setProduct(data);
        setErrorCount(0);
      } catch (error) {
        console.error("Error fetching product data:", error);
        setErrorCount(1);
      }
    };

    fetchData();
  }, []);

  const handleClick = () => {
    navigate('/cart');
  };

  const handleClickCheckout = () => {
    navigate('/checkout');
  };

  if (!product) {
    return <div>Loading product...</div>;
  }

  return (
    <div>
      <h2>{product.name}</h2>
      <img src={product.image} alt={product.name} />
      <p>{product.description}</p>
      <p>Price: ${product.price}</p>
      <button onClick={handleClick}>Add to Cart</button>
      <button onClick={handleClickCheckout}>Checkout</button>
    </div>
  );
};

export default ProductPage;