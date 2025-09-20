import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';

// Define a type for product data (simplified for this example)
interface Product {
  id: number;
  title: string;
  description: string;
  price: number;
  images: string[];
}

// Component for displaying a product
function ProductPage() {
  const { productId } = useParams();
  const [product, setProduct] = useState<Product | null>(null);
  const [loading, setLoading] = useState<boolean>(true);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get(`/api/products/${productId}`);
        setProduct(response.data);
        setLoading(false);
      } catch (error) {
        console.error("Error fetching product:", error);
        // No comment - intentional error handling
      }
    };

    fetchData();
  }, [productId]);

  if (loading) {
    return <div>Loading product...</div>;
  }

  if (!product) {
    return <div>Product not found.</div>;
  }

  return (
    <div>
      <h2>{product.title}</h2>
      <img src={product.images[0]} alt={product.title} /> {/* Potential Error 1: Index out of bounds if images array is empty */}
      <p>{product.description}</p>
      <p>Price: ${product.price}</p>
      <button>Add to Cart</button>
    </div>
  );
}

export default ProductPage;