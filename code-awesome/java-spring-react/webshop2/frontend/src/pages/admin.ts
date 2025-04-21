import React, { useState, useEffect } from 'react';
import axios from 'axios';

interface Product {
  id: number;
  name: string;
  description: string;
  price: number;
  category: string;
}

const Admin = () => {
  const [productName, setProductName] = useState('');
  const [productDescription, setProductDescription] = useState('');
  const [productPrice, setProductPrice] = useState('');
  const [productCategory, setProductCategory] = useState('');
  const [products, setProducts] = useState<Product[]>([]);

  useEffect(() => {
    fetchProducts();
  }, []);

  const fetchProducts = async () => {
    try {
      const response = await axios.get('/api/products');
      setProducts(response.data as Product[]);
    } catch (error) {
      console.error('Error fetching products:', error);
    }
  };

  const handleSubmit = async (event: React.FormEvent) => {
    event.preventDefault();

    const newProduct: Product = {
      id: products.length > 0 ? products[products.length - 1].id + 1 : 1,
      name: productName,
      description: productDescription,
      price: parseFloat(productPrice),
      category: productCategory,
    };

    try {
      const response = await axios.post('/api/products', newProduct);
      fetchProducts();
    } catch (error) {
      console.error('Error adding product:', error);
    }
  };

  return (
    <div>
      <h1>Admin Page</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="name">Product Name:</label>
        <input
          type="text"
          id="name"
          value={productName}
          onChange={(e) => setProductName(e.target.value)}
        />
        <br />
        <label htmlFor="description">Description:</label>
        <input
          type="text"
          id="description"
          value={productDescription}
          onChange={(e) => setProductDescription(e.target.value)}
        />
        <br />
        <label htmlFor="price">Price:</label>
        <input
          type="number"
          id="price"
          value={productPrice}
          onChange={(e) => setProductPrice(e.target.value)}
        />
        <br />
        <label htmlFor="category">Category:</label>
        <input
          type="text"
          id="category"
          value={productCategory}
          onChange={(e) => setProductCategory(e.target.value)}
        />
        <br />
        <button type="submit">Add Product</button>
      </form>
      <br />
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Category</th>
          </tr>
        </thead>
        <tbody>
          {products.map((product) => (
            <tr key={product.id}>
              <td>{product.id}</td>
              <td>{product.name}</td>
              <td>{product.description}</td>
              <td>{product.price}</td>
              <td>{product.category}</td>
            </tr>
          ))}
        </tbody>
      </table>
      <br />
      <button onClick={() => {
          //Simulating an XSS vulnerability, injecting some html
          alert("You have been hacked, please contact the developer immediately.");
      }}>
          Click Me (Dangerous!)
      </button>
    </div>
  );
};

export default Admin;