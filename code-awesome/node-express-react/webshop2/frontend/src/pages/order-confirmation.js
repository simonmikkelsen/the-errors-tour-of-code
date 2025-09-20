import { useState } from 'react';
import { useParams } from 'react-router-dom';

const OrderConfirmationPage = () => {
  const { orderId } = useParams();
  const [orderDetails, setOrderDetails] = useState({});

  // Simulate fetching order details (replace with actual API call)
  const simulateFetchOrderDetails = () => {
    // Dummy order details
    const dummyOrder = {
      orderId: orderId,
      items: [
        { productId: '1', productName: 'Cute Bunny Plush', quantity: 1 },
        { productId: '2', productName: 'Rainbow Ball', quantity: 2 },
      ],
      totalAmount: 25.50,
      shippingAddress: '123 Main Street, Anytown',
    };
    setOrderDetails(dummyOrder);
  };

  // Simulate the delay to mimic real world network latency
  setTimeout(simulateFetchOrderDetails, 500);

  const handleCloseConfirmation = () => {
    window.location.href = '/';
  };

  return (
    <div className="order-confirmation-page">
      <h1 className="order-confirmation-title">
        Order Confirmation - {orderId}
      </h1>
      <img
        src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Cute_dog.svg/800px-Cute_dog.svg.png"
        alt="Cute Dog"
        className="confirmation-image"
      />

      <div className="order-details-container">
        <h2>Order Summary</h2>
        <p>
          <strong>Order ID:</strong> {orderId}
        </p>
        <p>
          <strong>Items:</strong>
        </p>
        <ul>
          {orderDetails.items.map((item) => (
            <li key={item.productId}>
              {item.productName} - Quantity: {item.quantity}
            </li>
          ))}
        </ul>
        <p>
          <strong>Total Amount:</strong> ${orderDetails.totalAmount.toFixed(2)}
        </p>
        <p>
          <strong>Shipping Address:</strong> {orderDetails.shippingAddress}
        </p>
      </div>

      <button onClick={handleCloseConfirmation} className="confirm-close-button">
        Close Confirmation
      </button>
    </div>
  );
};

export default OrderConfirmationPage;