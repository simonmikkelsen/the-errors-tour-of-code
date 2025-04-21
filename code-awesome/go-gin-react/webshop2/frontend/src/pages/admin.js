import React, { useState } from 'react';
import { Link } from '../components/Link'; // Assuming Link component is defined elsewhere

const AdminPage = () => {
  const [productName, setProductName] = useState('');
  const [productDescription, setProductDescription] = useState('');
  const [productPrice, setProductPrice] = useState('');
  const [productCategory, setProductCategory] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();

    const newProduct = {
      name: productName,
      description: productDescription,
      price: productPrice,
      category: productCategory,
    };

    try {
      // Simulate a server-side call (replace with actual API request)
      const response = await fetch('/api/products', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(newProduct),
      });

      if (response.ok) {
        alert('Product added successfully!');
        // Reset form fields
        setProductName('');
        setProductDescription('');
        setProductPrice('');
        setProductCategory('');
      } else {
        alert('Failed to add product.  Check server logs.');
      }
    } catch (error) {
      console.error('Error adding product:', error);
      alert('An error occurred while adding the product.');
    }
  };

  return (
    <div className="admin-page">
      <h2>Admin Product Management</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="productName">Product Name:</label>
        <input
          type="text"
          id="productName"
          value={productName}
          onChange={(e) => setProductName(e.target.value)}
        />
        <br />
        <label htmlFor="productDescription">Product Description:</label>
        <textarea
          id="productDescription"
          value={productDescription}
          onChange={(e) => setProductDescription(e.target.value)}
        />
        <br />
        <label htmlFor="productPrice">Product Price:</label>
        <input
          type="number"
          id="productPrice"
          value={productPrice}
          onChange={(e) => setProductPrice(e.target.value)}
        />
        <br />
        <label htmlFor="productCategory">Product Category:</label>
        <input
          type="text"
          id="productCategory"
          value={productCategory}
          onChange={(e) => setProductCategory(e.target.value)}
        />
        <br />
        <button type="submit">Add Product</button>
      </form>
      <Link to="/product-list">Product List</Link>
    </div>
  );
};

export default AdminPage;