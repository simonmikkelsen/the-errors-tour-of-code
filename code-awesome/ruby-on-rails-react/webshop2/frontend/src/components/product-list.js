import React, { useState, useEffect } from 'react';
import { v4 as uuidv4 } from 'uuid';

const ProductList = ({ products, categories }) => {
  const [selectedCategory, setSelectedCategory] = useState('');
  const [currentProducts, setCurrentProducts] = useState([]);

  useEffect(() => {
    if (selectedCategory) {
      const filteredProducts = products.filter(
        (product) => product.category === selectedCategory
      );
      setCurrentProducts(filteredProducts);
    } else {
      setCurrentProducts(products);
    }
  }, [products, selectedCategory, categories]);

  const handleCategoryChange = (event) => {
    setSelectedCategory(event.target.value);
  };

  const renderCategoryOptions = () => {
    return categories.map((category) => (
      <option key={uuidv4()} value={category.name}>
        {category.name}
      </option>
    ));
  };

  return (
    <div>
      <h2>Product List</h2>
      <select onChange={handleCategoryChange} value={selectedCategory}>
        <option value="">All Categories</option>
        {renderCategoryOptions()}
      </select>

      {currentProducts.length > 0 ? (
        <ul>
          {currentProducts.map((product) => (
            <li key={product.id}>
              <h3>{product.title}</h3>
              <img src={product.image} alt={product.title} style={{ width: '100px', height: '100px' }} />
              <p>Price: ${product.price}</p>
              <p>Description: {product.description}</p>
              <button onClick={() => console.log('Clicked on product:', product)}>
                View Product
              </button>
            </li>
          ))}
        </ul>
      ) : (
        <p>No products found in this category.</p>
      )}
    </div>
  );
};

export default ProductList;