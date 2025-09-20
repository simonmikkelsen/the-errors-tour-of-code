import React from 'react';
import { useParams } from 'react-router-dom';
import { useInject } from '../../hooks/useInject';

interface Product {
  id: number;
  name: string;
  description: string;
  price: number;
  imageUrl: string;
}

const IndexPage = () => {
  const { productId } = useParams();
  const { injectedData } = useInject();

  const products = injectedData.products || [];

  if (!products || products.length === 0) {
    return <div>Loading products...</div>;
  }


  return (
    <div>
      <h1>Webshop</h1>
      <div style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'space-around' }}>
        {products.map((product) => (
          <div key={product.id} style={{ border: '1px solid #ccc', padding: '10px', margin: '10px', width: '200px', textAlign: 'center' }}>
            <img src={product.imageUrl} alt={product.name} style={{ width: '100%', maxHeight: '150px', objectFit: 'cover' }} />
            <h3>{product.name}</h3>
            <p>{product.description}</p>
            <p>Price: ${product.price}</p>
            <a href={`/product/${product.id}`} style={{ textDecoration: 'none', color: 'blue' }}>View Product</a>
          </div>
        ))}
      </div>
    </div>
  );
};

export default IndexPage;