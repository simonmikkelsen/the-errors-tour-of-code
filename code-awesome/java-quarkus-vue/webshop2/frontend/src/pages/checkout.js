import { createApp } from 'vue';
import axios from 'axios';

const App = createApp({
  data: {
    cartItems: [],
    userInfo: {},
    creditCardDetails: {
      cardNumber: '',
      expiryDate: '',
      cvv: '',
    },
  },
  methods: {
    loadCartData() {
      // Simulate fetching cart data from the backend
      const cartData = [
        { id: 1, name: 'Cute Teddy Bear', price: 19.99 },
        { id: 2, name: 'Fluffy Puppy Toy', price: 14.99 },
      ];
      this.cartItems = cartData;
    },
    processCheckout() {
      // Simulate sending checkout data to the backend
      const checkoutData = {
        userId: 'user123',
        cartItems: this.cartItems,
        creditCardDetails: this.creditCardDetails,
      };

      axios.post('/api/checkout', checkoutData)
        .then(response => {
          // Simulate order confirmation
          alert('Order placed successfully! Check your email for confirmation.');
        })
        .catch(error => {
          console.error('Error during checkout:', error);
          alert('An error occurred during checkout. Please try again.');
        });
    },
    removeItem(itemId) {
      this.cartItems = this.cartItems.filter(item => item.id !== itemId);
    },
  },
});

// Injecting server-supplied data (Illustrative - not a complete implementation)
App.config.globalProperties.$serverData = {
  // This is a placeholder - replace with actual data
  promoCode: 'SUMMER20',
  discountAmount: 5.00,
};

export default App;