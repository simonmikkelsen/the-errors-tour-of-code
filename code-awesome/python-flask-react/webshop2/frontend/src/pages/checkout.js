import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const Checkout = () => {
  const navigate = useNavigate();
  const [cartItems, setCartItems] = useState([]);
  const [userDetails, setUserDetails] = useState({});
  const [paymentDetails, setPaymentDetails] = useState({});
  const [errors, setErrors] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const userResponse = await axios.get('/api/users');
        setUserDetails(userResponse.data);
      } catch (error) {
        console.error('Error fetching user data:', error);
      }
    };

    fetchData();
  }, []);

  const handleRemoveItem = (itemId) => {
    // Implement logic to remove item from cart and update state
    // This is just a placeholder
    console.log(`Removing item with id: ${itemId}`);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    // Validate form data (basic example)
    const formErrors = {};

    if (!userDetails.name) {
      formErrors.name = 'Name is required';
    }
    if (!userDetails.address) {
      formErrors.address = 'Address is required';
    }
    if (!paymentDetails.cardNumber) {
      formErrors.cardNumber = 'Card Number is required';
    }

    if (Object.keys(formErrors).length > 0) {
      console.error('Form validation errors:', formErrors);
      return;
    }

    // Send data to backend (example using axios)
    try {
      const response = await axios.post('/api/checkout', {
        name: userDetails.name,
        address: userDetails.address,
        cardNumber: paymentDetails.cardNumber,
        items: cartItems, // Assuming cartItems is already in the correct format
      });

      console.log('Checkout successful:', response.data);

      // Redirect to order confirmation page
      navigate('/orderconfirmation');
    } catch (error) {
      console.error('Error during checkout:', error);
      // Handle error appropriately, e.g., display an error message
    }
  };

  return (
    <div>
      <h2>Checkout</h2>

      {/* Cart items display */}
      <h3>Cart Items</h3>
      {cartItems.length > 0 ? (
        <ul>
          {cartItems.map((item) => (
            <li key={item.id}>
              {item.name} - ${item.price}
              <button onClick={() => handleRemoveItem(item.id)}>Remove</button>
            </li>
          ))}
        </ul>
      ) : (
        <p>Your cart is empty.</p>
      )}

      {/* Form elements */}
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="name">Name:</label>
          <input type="text" id="name" name="name" value={userDetails.name} />
        </div>
        <div>
          <label htmlFor="address">Address:</label>
          <input type="text" id="address" name="address" value={userDetails.address} />
        </div>
        <div>
          <label htmlFor="cardNumber">Card Number:</label>
          <input type="text" id="cardNumber" name="cardNumber" value={paymentDetails.cardNumber} />
        </div>

        <button type="submit">Place Order</button>
      </form>
    </div>
  );
};

export default Checkout;