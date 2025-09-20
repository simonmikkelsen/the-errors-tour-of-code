import React, { useState, useEffect } from 'react';
import { useForm } from 'react-hook-form';

const Checkout = () => {
  const { register, handleSubmit, formState: { errors } } = useForm();

  const [cartItems, setCartItems] = useState([]);
  const [totalPrice, setTotalPrice] = useState(0);

  useEffect(() => {
    // Simulate fetching cart items and calculating total price
    const items = [
      { id: 1, name: 'Cute Teddy Bear', price: 20 },
      { id: 2, name: 'Fluffy Bunny', price: 30 },
    ];
    setCartItems(items);
    setTotalPrice(items.reduce((sum, item) => sum + item.price, 0));
  }, []);

  const onSubmit = (data) => {
    // Simulate saving data to the database
    console.log('Order submitted:', data);
    alert('Order placed successfully!');

    // Reset cart items (for demonstration purposes)
    setCartItems([]);
    setTotalPrice(0);
  };

  return (
    <div className="checkout-page">
      <h2>Checkout</h2>

      <h3>Cart Items</h3>
      {cartItems.length > 0 ? (
        <ul>
          {cartItems.map((item) => (
            <li key={item.id}>
              {item.name} - ${item.price}
            </li>
          ))}
        </ul>
      ) : (
        <p>Your cart is empty.</p>
      )}

      <h3>Payment Information</h3>
      <form onSubmit={onSubmit}>
        <label htmlFor="name">Name:</label>
        <input type="text" id="name" name="name" ref={register}  />

        <label htmlFor="address">Address:</label>
        <input type="text" id="address" name="address" ref={register} />

        <label htmlFor="creditCard">Credit Card Number:</label>
        <input type="text" id="creditCard" name="creditCard" ref={register} />

        <button type="submit">Place Order</button>
      </form>
    </div>
  );
};

export default Checkout;