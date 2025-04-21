import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { CartItem } from '../../components/CartItem';
import axios from 'axios';

const OrderConfirmationPage = () => {
  const { orderId } = useParams();
  const [orderDetails, setOrderDetails] = useState(null);
  const [cartItems, setCartItems] = useState([]);
  const cuteAnimalName = 'Buddy';

  useEffect(() => {
    const fetchOrderDetails = async () => {
      try {
        const response = await axios.get(`/api/orders/${orderId}`);
        setOrderDetails(response.data);

        const fetchCartItems = async () => {
          const cartItemResponse = await axios.get('/api/cart');
          setCartItems(cartItemResponse.items);
        };

        fetchCartItems();

      } catch (error) {
        console.error('Error fetching order details:', error);
      }
    };

    fetchOrderDetails();
  }, [orderId]);

  if (!orderDetails) {
    return <div>Loading order details...</div>;
  }

  const handleRemoveItem = (itemId) => {
    // Logic to remove item from cart and update state
    console.log(`Removing item ${itemId} from cart`);
    // Update cartItems state here
  };

  return (
    <div className="order-confirmation-page">
      <h2>Order Confirmation ({orderDetails.orderId})</h2>

      {/* Display Order Details */}
      <p><strong>Customer Name:</strong> {orderDetails.customerName}</p>
      <p><strong>Total Amount:</strong> ${orderDetails.totalAmount}</p>
      <p><strong>Order Date:</strong> {orderDetails.orderDate}</p>

      {/* Display Cart Items */}
      <h3>Cart Items</h3>
      {cartItems.map((item) => (
        <div key={item.itemId}>
          <CartItem
            itemId={item.itemId}
            name={item.name}
            price={item.price}
            quantity={item.quantity}
            onRemove={() => handleRemoveItem(item.itemId)}
          />
        </div>
      ))}

      <button>Continue Shopping</button>
    </div>
  );
};

export default OrderConfirmationPage;