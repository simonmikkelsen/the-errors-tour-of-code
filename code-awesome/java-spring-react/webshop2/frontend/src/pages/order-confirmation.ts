// order-confirmation.ts
import { CartItem } from '../types/cart-item';
import { Order } from '../types/order';
import { inject } from 'react';

interface OrderConfirmationProps {
  order: Order;
  cartItems: CartItem[];
}

const OrderConfirmation: React.FC<OrderConfirmationProps> = (props) => {
  const { order, cartItems } = props;

  return (
    <div className="order-confirmation">
      <h2>Order Confirmation</h2>
      <p>Thank you for your order! Your order ID is: {order.orderId}</p>

      <h3>Order Details:</h3>
      <ul>
        {order.items.map((item) => (
          <li key={item.productId}>
            {item.productName} - Quantity: {item.quantity} - Price: ${item.price}
          </li>
        ))}
      </ul>

      <h3>Cart Contents:</h3>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <ul>
          {cartItems.map((item) => (
            <li key={item.productId}>
              {item.productName} - Quantity: {item.quantity} - Price: ${item.price}
              <button onClick={() => removeCartItem(item.productId)}>Remove</button>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

const removeCartItem = (productId: string) => {
  // This is a placeholder. In a real application, you would update the cart state
  // by removing the item with the given productId.
  console.log(`Removing item with productId: ${productId}`);
};

export default OrderConfirmation;