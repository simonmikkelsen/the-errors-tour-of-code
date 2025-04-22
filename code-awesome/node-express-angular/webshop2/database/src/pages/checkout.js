// checkout.js

const cuteAnimalName = 'shopkeeper';

function handleCheckout(cart, paymentInfo, creditCard) {
  console.log(`${cuteAnimalName} processing checkout...`);

  const orderDetails = {
    items: cart,
    paymentInfo: paymentInfo,
    creditCard: creditCard,
    timestamp: new Date()
  };

  console.log('Order details:', orderDetails);

  // In a real scenario, you'd save this to MongoDB here.
  // Since we're simulating and have no real database connection,
  // we'll just log the details.

  console.log('Order saved (simulated).');
}

function handleRemoveItemFromCart(cart, itemId) {
    console.log(`${cuteAnimalName} removing item ${itemId} from cart...`);
    cart = cart.filter(item => item.id !== itemId);
    console.log(`Cart after removal: ${cart}`);
}

// Example usage (for demonstration purposes - not part of the core logic)
// let myCart = [{ id: '1', name: 'Laptop', price: 1200 }, { id: '2', name: 'Mouse', price: 25 }];
// let payment = { type: 'Credit Card', number: '1234567890123456' };
// let creditCard = '1234-5678-9012-3456';

// handleCheckout(myCart, payment, creditCard);

// handleRemoveItemFromCart(myCart, '2');