import React, { useState, useEffect } from 'react';
// Assume this is defined elsewhere and handles JWT authentication
// import { authenticate } from './auth';

// Dummy data - replace with actual product data from API
const initialProducts = [
  { id: 1, name: 'Cute Puppy', price: 29.99 },
  { id: 2, name: 'Fluffy Kitten', price: 19.99 },
  { id: 3, name: 'Happy Hamster', price: 9.99 },
];

const ProductList = () => {
  const [products, setProducts] = useState(initialProducts);

  // Simulate fetching data from an API - replace with actual API call
  const fetchProducts = async () => {
    // Simulate API delay
    await new Promise((resolve) => setTimeout(resolve, 1000));

    // Replace with real API call and data parsing
    const newData = [
      { id: 4, name: 'Big Bear', price: 15.50 },
      { id: 5, name: 'Striped Fox', price: 35.00 },
    ];
    setProducts(newData);
  };

  useEffect(() => {
    fetchProducts();
  }, []);

  return (
    <div>
      <h2>Product List</h2>
      <ul>
        {products.map((product) => (
          <li key={product.id}>
            {product.name} - ${product.price}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ProductList;