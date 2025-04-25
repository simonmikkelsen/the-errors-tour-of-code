import { useState } from 'react';
import { useNavigate } from 'react-router-dom';

interface CheckoutState {
  cartItems: string[];
  totalAmount: number;
  paymentInfo: {
    cardNumber: string;
    expiryDate: string;
    cvv: string;
  };
}

const CheckoutPage = () => {
  const [cartItems, setCartItems] = useState<string[]>([
    'Cute Kitten Toy',
    'Rainbow Unicorn Plush',
    'Fluffy Puppy Bed'
  ]);
  const [totalAmount, setTotalAmount] = useState(75.00);
  const navigate = useNavigate();

  const handlePay = () => {
    // Simulate payment processing
    console.log('Processing payment...');

    // Placeholder for actual payment integration
    // Send payment details to a payment gateway

    // Update state to reflect successful payment
    setCartItems([]); // Empty cart after payment
    setTotalAmount(0);
    alert('Payment successful! Thank you for your purchase.');

    // Redirect to a success page
    navigate('/success');
  };

  const handleCancel = () => {
    // Reset cart and navigate back to the product listing
    navigate('/products');
  };


  return (
    <div className="checkout-page">
      <h2>Checkout</h2>

      <div className="payment-details">
        <h3>Payment Information</h3>
        <label htmlFor="cardNumber">Card Number:</label>
        <input type="text" id="cardNumber" name="cardNumber" value={paymentInfo.cardNumber} />
        <label htmlFor="expiryDate">Expiry Date:</label>
        <input type="text" id="expiryDate" name="expiryDate" value={paymentInfo.expiryDate} />
        <label htmlFor="cvv">CVV:</label>
        <input type="text" id="cvv" name="cvv" value={paymentInfo.cvv} />
      </div>

      <div className="order-summary">
        <h3>Order Summary</h3>
        <ul>
          {cartItems.map((item, index) => (
            <li key={index}>{item} - ${37.50}</li>
          ))}
        </ul>
        <p><strong>Total Amount:</strong> ${75.00}</p>
      </div>

      <button onClick={handlePay} className="checkout-button">Pay Now</button>
      <button onClick={handleCancel} className="cancel-button">Cancel</button>
    </div>
  );
};

export default CheckoutPage;