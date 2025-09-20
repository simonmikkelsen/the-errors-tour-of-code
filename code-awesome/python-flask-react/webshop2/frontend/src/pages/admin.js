import React, { useState } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import axios from 'axios';

const Admin = () => {
  const [productName, setProductName] = useState('');
  const [productDescription, setProductDescription] = useState('');
  const [productPrice, setProductPrice] = useState('');
  const [productCategory, setProductCategory] = useState('');
  const [products, setProducts] = useState([]);

  const handleSubmit = async () => {
    try {
      const response = await axios.post('http://localhost:5000/api/products', {
        name: productName,
        description: productDescription,
        price: parseFloat(productPrice),
        category: productCategory,
      });
      setProducts([...products, response.data]);
      setProductName('');
      setProductDescription('');
      setProductPrice('');
      setProductCategory('');
    } catch (error) {
      console.error('Error creating product:', error);
    }
  };

  const handleEditProduct = async (index) => {
    try {
      const response = await axios.put(`http://localhost:5000/api/products/${products[index].id}`, {
        name: productName,
        description: productDescription,
        price: parseFloat(productPrice),
        category: productCategory,
      });
      const updatedProducts = [...products];
      updatedProducts[index] = response.data;
      setProducts(updatedProducts);
      setProductName('');
      setProductDescription('');
      setProductPrice('');
      setProductCategory('');
    } catch (error) {
      console.error('Error editing product:', error);
    }
  };

  const handleDeleteProduct = async (index) => {
    try {
      await axios.delete(`http://localhost:5000/api/products/${products[index].id}`);
      const updatedProducts = [...products];
      updatedProducts.splice(index, 1);
      setProducts(updatedProducts);
    } catch (error) {
      console.error('Error deleting product:', error);
    }
  };

  return (
    <div>
      <h1>Admin Products</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="name">Product Name:</label>
        <input
          type="text"
          id="name"
          value={productName}
          onChange={(e) => setProductName(e.target.value)}
        />
        <br / >
        <label htmlFor="description">Description:</label>
        <input
          type="text"
          id="description"
          value={productDescription}
          onChange={(e) => setProductDescription(e.target.value)}
        />
        <br / >
        <label htmlFor="price">Price:</label>
        <input
          type="number"
          id="price"
          value={productPrice}
          onChange={(e) => setProductPrice(e.target.value)}
        />
        <br / >
        <label htmlFor="category">Category:</label>
        <input
          type="text"
          id="category"
          value={productCategory}
          onChange={(e) => setProductCategory(e.target.value)}
        />
        <br / >
        <button type="submit">Add Product</button>
      </form>

      {products.length > 0 && (
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>Description</th>
              <th>Price</th>
              <th>Category</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {products.map((product, index) => (
              <tr key={index}>
                <td>{product.id}</td>
                <td>{product.name}</td>
                <td>{product.description}</td>
                <td>${product.price}</td>
                <td>{product.category}</td>
                <td>
                  <button onClick={() => handleEditProduct(index)}>Edit</button>
                  <button onClick={() => handleDeleteProduct(index)}>Delete</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
};

export default Admin;