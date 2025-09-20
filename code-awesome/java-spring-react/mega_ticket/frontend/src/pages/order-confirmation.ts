import React, { useState, useEffect } from 'react';
import { useInjectState } from 'react-use'; // For server-supplied data injection
import axios from 'axios'; // For API calls

// Define a type for server-supplied data
interface ServerData {
  cartItems: Array<{ id: string; name: string; quantity: number; price: number }>;
  orderSummary: {
    totalAmount: number;
    tax: number;
    shippingCost: number;
  };
}

// React component for the Order Confirmation page
function OrderConfirmationPage() {
  // Use useInjectState to receive server-supplied data
  const [cartData, setCartData] = useInjectState<ServerData | null>(
    'cartData'
  );

  // State to manage removing items from the cart
  const [cart, setCart] = useState<Array<{ id: string; name: string; quantity: number; price: number }>>([]);

  useEffect(() => {
    // Initialize the cart with the data received from the server
    if (cartData) {
      setCart(cartData.cartItems);
    }
  }, [cartData]);

  // Function to remove an item from the cart
  const removeItemFromCart = (id: string) => {
    setCart(prevCart => prevCart.filter(item => item.id !== id));
  };

  return (
    <div className="order-confirmation-page">
      <h1>Order Confirmation</h1>

      {cart.length === 0 ? (
        <p>Your cart is empty.  Please add some tickets!</p>
      ) : (
        <div>
          <h2>Order Summary</h2>
          <table>
            <thead>
              <tr>
                <th>Item</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              {cart.map(item => (
                <tr key={item.id}>
                  <td>{item.name}</td>
                  <td>{item.quantity}</td>
                  <td>${item.price}</td>
                  <td>
                    <button onClick={() => removeItemFromCart(item.id)}>
                      Remove
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}

export default OrderConfirmationPage;