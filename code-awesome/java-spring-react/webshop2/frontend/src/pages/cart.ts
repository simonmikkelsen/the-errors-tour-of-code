import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';

// Define a type for product data
interface Product {
  id: number;
  name: string;
  price: number;
  imageUrl: string;
  quantity: number;
}

// Define a type for cart data
interface CartData {
  [key: string]: Product;
}

const CartPage = () => {
  const { productId } = useParams();
  const [cart, setCart] = useState<CartData>({});
  const [products, setProducts] = useState<Product[]>([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const productResponse = await axios.get('http://localhost:8080/products');
        setProducts(productResponse.data);
      } catch (error) {
        console.error('Error fetching products:', error);
      }
    };

    fetchData();
  }, []);

  useEffect(() => {
    const fetchCartData = async () => {
      try {
        const response = await axios.get('http://localhost:8080/cart/' + productId);
        const cartData = response.data;
        setCart(cartData);
      } catch (error) {
        console.error('Error fetching cart data:', error);
      }
    };

    fetchCartData();
  }, [productId]);


  const handleRemoveItem = (itemId: number) => {
    const updatedCart = { ...cart };
    delete updatedCart[itemId];
    setCart(updatedCart);
  };

  return (
    <div>
      <h2>Shopping Cart</h2>
      {Object.keys(cart).length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <div>
          {Object.entries(cart).map(([itemId, product]) => (
            <div key={itemId}>
              <h3>{product.name}</h3>
              <img src={product.imageUrl} alt={product.name} style={{maxWidth: '100px', maxHeight: '100px'}}/>
              <p>Price: ${product.price}</p>
              <p>Quantity: {product.quantity}</p>
              <button onClick={() => handleRemoveItem(itemId)}>Remove</button>
            </div>
          ))}
        </div>
      )}
      <button>Checkout</button>
    </div>
  );
};

export default CartPage;