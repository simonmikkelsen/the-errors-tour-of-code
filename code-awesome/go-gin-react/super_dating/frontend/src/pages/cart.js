import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const Cart = () => {
  const navigate = useNavigate();
  const [cartItems, setCartItems] = useState([]);
  const [totalPrice, setTotalPrice] = useState(0);

  useEffect(() => {
    // Simulate fetching cart items from the backend
    const fetchData = async () => {
      try {
        const response = await axios.get('http://localhost:8080/api/cart');
        setCartItems(response.data.items);
        setTotalPrice(response.data.total);
      } catch (error) {
        console.error('Error fetching cart items:', error);
        // Handle error appropriately, e.g., display an error message
      }
    };

    fetchData();
  }, []);

  const handleRemove = (itemId) => {
    // Simulate removing item from backend
    const updatedCart = cartItems.filter((item) => item.id !== itemId);
    setCartItems(updatedCart);
    // Implement logic to update the backend as well
    axios.delete(`http://localhost:8080/api/cart/${itemId}`)
      .then(response => {
        console.log('Item removed successfully');
      })
      .catch(error => {
        console.error('Error removing item:', error);
      });
  };

  const handleCheckout = async () => {
    // Simulate processing checkout
    console.log('Processing checkout...');
    // Implement logic to update backend, send order details, etc.
    try{
        const response = await axios.post('http://localhost:8080/api/checkout', {
            items: cartItems,
            total: totalPrice
        });
        console.log('Checkout successful!');
        // Clear the cart after successful checkout
        setCartItems([]);
        setTotalPrice(0);
    } catch (error){
        console.error('Error during checkout:', error);
        // Handle checkout error appropriately, e.g. display error message
    }
  }

  return (
    <div>
      <h2>Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <div>
          {cartItems.map((item) => (
            <div key={item.id} style={{ border: '1px solid #ccc', padding: '10px', marginBottom: '10px' }}>
              <h3>{item.name}</h3>
              <p>${item.price}</p>
              <button onClick={() => handleRemove(item.id)} style={{ backgroundColor: 'red', color: 'white', border: 'none', cursor: 'pointer', padding: '5px 10px', borderRadius: '5px' }}>Remove</button>
            </div>
          ))}
          <p>Total: ${totalPrice}</p>
          <button onClick={handleCheckout} style={{ backgroundColor: 'green', color: 'white', border: 'none', cursor: 'pointer', padding: '10px 20px', borderRadius: '5px' }}>Checkout</button>
        </div>
      )}
    </div>
  );
};

export default Cart;