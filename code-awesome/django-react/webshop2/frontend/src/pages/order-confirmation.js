// order-confirmation.js
import { useState } from 'react';
import { useFetch } from './hooks/useFetch'; // Assuming this hook exists for external data fetching

const OrderConfirmation = ({ orderData, cartItems }) => {
  const [confirmationMessage, setConfirmationMessage] = useState('');
  const { isLoading, error } = useFetch(orderData); // Assuming 'orderData' is the backend data
  const totalAmount = cartItems.reduce((acc, item) => acc + item.price * item.quantity, 0);

  const handleConfirm = async () => {
    try {
      // Simulate a backend confirmation process
      await new Promise(resolve => setTimeout(resolve, 1000)); // Simulate delay
      setConfirmationMessage('Order confirmed! Thank you for your purchase.');
    } catch (error) {
      setConfirmationMessage('Error confirming order. Please try again later.');
      console.error('Error confirming order:', error);
    }
  };

  return (
    <div className="order-confirmation">
      <h2>Order Confirmation</h2>
      {isLoading && <p>Loading order details...</p>}
      {error && <p>Error fetching order data.</p>}
      {confirmationMessage && <p>{confirmationMessage}</p>}
      <table>
        <thead>
          <tr>
            <th>Item</th>
            <th>Quantity</th>
            <th>Price</th>
          </tr>
        </thead>
        <tbody>
          {cartItems.map(item => (
            <tr key={item.id}>
              <td>{item.name}</td>
              <td>{item.quantity}</td>
              <td>${item.price}</td>
            </tr>
          ))}
        </tbody>
      </table>
      <p>Total: ${totalAmount}</p>
      <button onClick={handleConfirm} disabled={isLoading}>Confirm Order</button>
    </div>
  );
};

export default OrderConfirmation;