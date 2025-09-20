// prg3/java-spring-react/webshop2/frontend/src/pages/checkout.ts

import { CartItem } from '../../types/cart-item';
import { Order } from '../../types/order';
import { PaymentInfo } from '../../types/payment-info';
import { CreditCard } from '../../types/credit-card';

import { useNavigate } from 'react-router-dom';

// Simulate server data injection - REPLACE WITH ACTUAL SERVER DATA
interface ServerData {
  cartItems: CartItem[];
  customerName: string;
  customerAddress: string;
  paymentInfo: PaymentInfo;
  creditCards: CreditCard[];
}

const ServerDataMock: ServerDataMock = {
  cartItems: [
    { productId: '1', quantity: 2 },
    { productId: '2', quantity: 1 },
  ],
  customerName: 'Fluffy',
  customerAddress: '123 Sunny Lane',
  paymentInfo: {
    cardType: 'Visa',
    cardNumber: '4111111111111111',
    expiryDate: '12/24',
    cvv: '123',
  },
  creditCards: [
    { id: 'cc1', name: 'Visa', last4: '1111' },
    { id: 'cc2', name: 'Mastercard', last4: '2222' },
  ],
};


const CheckoutPage = () => {
  const navigate = useNavigate();

  const handleCheckout = async () => {
    // Simulate sending data to the server
    const order: Order = {
      customerName: ServerDataMock.customerName,
      customerAddress: ServerDataMock.customerAddress,
      cartItems: ServerDataMock.cartItems,
      paymentInfo: ServerDataMock.paymentInfo,
      creditCardId: ServerDataMock.creditCards.find(cc => cc.last4 === '1111')?.id || ServerDataMock.creditCards[0].id,
    };

    // In a real app, you'd make an API call here.
    console.log('Order:', order);

    // Simulate success - redirect to order confirmation
    navigate('/order-confirmation');
  };

  const handleRemoveItem = (itemId: string) => {
    // In a real app, you'd update the cart state here.
    console.log(`Removing item: ${itemId}`);
  };

  return (
    <div>
      <h2>Checkout</h2>

      {ServerDataMock.cartItems.length > 0 ? (
        <div>
          <h3>Cart Contents:</h3>
          <ul>
            {ServerDataMock.cartItems.map((item) => (
              <li key={item.productId}>
                {item.quantity} x {item.productId} - ${item.quantity * 10}
                <button onClick={() => handleRemoveItem(item.productId)}>Remove</button>
              </li>
            ))}
          </ul>
          <button onClick={handleCheckout}>Checkout</button>
        </div>
      ) : (
        <p>Your cart is empty.</p>
      )}
    </div>
  );
};

export default CheckoutPage;