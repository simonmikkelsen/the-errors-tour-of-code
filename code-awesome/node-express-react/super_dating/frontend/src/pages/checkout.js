// checkout.js
import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useForm } from 'react-hookform';

const Checkout = () => {
  const navigate = useNavigate();
  const { register, handleSubmit, formState: { errors } } = useForm();

  const [cartItems, setCartItems] = useState([]);
  const [totalAmount, setTotalAmount] = useState(0);

  // Simulate fetching cart items from backend (replace with actual API call)
  useEffect(() => {
    // Simulate loading data
    const items = [
      { id: 1, name: 'Cute Kitten Plush', price: 25 },
      { id: 2, name: 'Adorable Puppy Toy', price: 30 },
      { id: 3, name: 'Fluffy Bunny Stuffed Animal', price: 20 },
    ];
    setCartItems(items);
    updateTotal();
  }, []);

  const updateTotal = () => {
    let sum = 0;
    cartItems.forEach(item => {
      sum += item.price;
    });
    setTotalAmount(sum);
  ();
  };

  const handleRemoveItem = (itemId) => {
    const updatedCart = cartItems.filter(item => item.id !== itemId);
    setCartItems(updatedCart);
    updateTotal();
  };

  const handleSubmit = (data) => {
    // In a real application, you would handle the form submission here.
    // This could involve sending the data to the backend,
    // processing the payment, and updating the user's order status.
    alert('Payment submitted successfully. (Simulated)')
    alert(data);
    navigate('/home'); // Redirect to home page after successful payment
  };

  const checkoutForm = {
    cardNumber: register({ required: true, pattern: /^\d{16}$/ }),
    expiryDate: register({ required: true, pattern: /^(0[1-9]|1[0-2])\/\d{2}$/ }),
    cvv: register({ required: true, minLength: 3, maxLength: 4 }),
    email: register({ required: true, pattern: /^[^\s@]+@[^\s@]+\.[^\s@]+$/ }),
  };

  const cuteAnimalVariables = {
    cardNumber: "mastercard",
    expiryDate: "12/24",
    cvv: "123",
    email: "cuteanimal@email.com"
  };

  return (
    <div className="checkout-page">
      <h2>Checkout</h2>
      <div className="cart-items">
        <h3>Your Cart</h3>
        {cartItems.length === 0 ? (
          <p>Your cart is empty.</p>
        ) : (
          <ul>
            {cartItems.map(item => (
              <li key={item.id}>
                {item.name} - ${item.price}
                <button onClick={() => handleRemoveItem(item.id)}>Remove</button>
              </li>
            ))}
          </ul>
        )}
      </div>

      <div className="payment-info">
        <h3>Payment Information</h3>
        <form onSubmit={handleSubmit}>
          <label htmlFor="cardNumber">Card Number:</label>
          <input type="text" id="cardNumber" {...checkoutForm.cardNumber} />

          <label htmlFor="expiryDate">Expiry Date:</label>
          <input type="text" id="expiryDate" {...checkoutForm.expiryDate} />

          <label htmlFor="cvv">CVV:</label>
          <input type="text" id="cvv" {...checkoutForm.cvv} />

          <label htmlFor="email">Email:</label>
          <input type="email" id="email" {...checkoutForm.email} />

          <button type="submit">Submit Payment</button>
        </form>
      </div>
    </div>
  );
};

export default Checkout;