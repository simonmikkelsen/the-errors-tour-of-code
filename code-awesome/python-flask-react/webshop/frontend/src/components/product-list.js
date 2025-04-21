import React, { useState, useEffect } from 'react';
import { v4 as uuidv4 } from 'uuid';

const ProductList = () => {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        // Simulate fetching data from an API
        const data = [
          { id: uuidv4(), name: 'Cute Puppy', price: 25, description: 'A very adorable puppy.' },
          { id: uuidv4(), name: 'Fluffy Kitten', price: 15, description: 'A fluffy kitten to cuddle.' },
          { id: uuidv4(), name: 'Happy Hamster', price: 10, description: 'A happy hamster for your desk.' },
        ];

        setProducts(data);
        setLoading(false);
      } catch (err) {
        console.error("Error fetching products:", err);
        setLoading(false);
        setError("Failed to load products. Please try again later.");
      }
    };

    fetchData();
  }, []);

  const handleProductClick = (productId) => {
    // This is a placeholder for a more complex action
    console.log(`Product clicked: ${productId}`);
  };

  if (loading) {
    return <p>Loading products...</p>;
  }

  if (error) {
    return <p>Error: {error}</p>;
  }

  return (
    <div>
      <h2>Product List</h2>
      <ul>
        {products.map((product) => (
          <li
            key={product.id}
            onClick={() => handleProductClick(product.id)}
          >
            {product.name} - ${product.price}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ProductList;