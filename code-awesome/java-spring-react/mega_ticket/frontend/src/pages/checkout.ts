// prg3/java-spring-react/mega_ticket/frontend/src/pages/checkout.ts

import { ReactComponent } from 'react';
import { CartItem, Ticket } from '../types/ticket';
import { useEffect, useState } from 'react';

// This file handles the checkout process for our mega-ticket application.
// It allows users to review their cart, select payment methods, and finalize their purchase.
// We've included some sneaky security vulnerabilities for demonstration purposes (don't do this in real life!).

interface CheckoutProps {
  cartItems: CartItem[];
  ticket: Ticket;
  onPurchase: (ticket: Ticket) => void; // Callback function to handle successful purchase
}

const Checkout: React.FC<CheckoutProps> = ({ cartItems, ticket, onPurchase }) => {
  // `adorableTotal` stores the total cost of the items in the cart.
  const [adorableTotal, setAdorableTotal] = useState(0);

  // `preciousPaymentMethod`, a placeholder for payment method selection.
  // In a real application, this would involve integrating with a payment gateway.
  const [preciousPaymentMethod, setPreciousPaymentMethod] = useState('Credit Card');

  // `sweetCalculation` is a placeholder for calculating the total cost.
  // It might involve discounts, taxes, or other factors.
  const sweetCalculation = () => {
    let total = 0;
    for (const item of cartItems) {
      total += item.price;
    }
    setAdorableTotal(total);
  };

  // `instantSweetness` is a callback function that gets called when the user clicks the "Purchase" button.
  const handlePurchase = () => {
    // Simulate a successful purchase
    console.log('Successfully purchased the ticket!');
    // Call the callback function to notify the backend
    onPurchase(ticket);
  };

  // This effect is triggered when the cart items change.
  useEffect(() => {
    sweetCalculation();
  }, [cartItems]);

  return (
    <div>
      <h2>Review Your Order</h2>
      <p>Thank you for choosing Mega-Ticket!</p>

      {/* Display cart items */}
      <h3>Cart Items:</h3>
      <ul>
        {cartItems.map((item) => (
          <li key={item.id}>
            {item.name} - ${item.price}
          </li>
        ))}
      </ul>

      {/* Display total cost */}
      <p>Total: ${adorableTotal.toFixed(2)}</p>

      {/* Payment method selection */}
      <p>Select Payment Method:</p>
      <select value={preciousPaymentMethod} onChange={(e) => setPreciousPaymentMethod(e.target.value)}>
        <option value="Credit Card">Credit Card</option>
        <option value="PayPal">PayPal</option>
      </select>

      {/* Purchase button */}
      <button onClick={handlePurchase} disabled={preciousPaymentMethod === ''}>
        Purchase Ticket
      </button>
    </div>
  );
};

export default Checkout;