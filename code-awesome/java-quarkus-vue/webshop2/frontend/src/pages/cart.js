import { createApp } from 'vue';
import App from './App.vue';
import {router} from '../../router';

const cart = new Vue.js.useState('cartData', () => {});

const cartData = () => {
  return cartData.value;
};

const cartItems = () => {
  return cartData.value.items;
};

const cartTotal = () => {
    return cartData.value.total
}

// Dummy data for demonstration purposes. Replace with actual database retrieval.
const dummyCartData = {
  items: [
    { id: 1, name: 'Cute Kitten Toy', price: 19.99, quantity: 1 },
    { id: 2, name: 'Fluffy Puppy Plush', price: 29.99, quantity: 2 },
  ],
  total: 89.97
};

// Vue instance for the cart page
const cartPage = {
  data() {
    return {
      cartData: dummyCartData,
      items: cartPage.data.items,
      total: cartPage.data.total
    };
  },
  mounted() {
    console.log('Cart items:', this.items);
  },
  methods: {
    removeItem(itemId) {
      this.items = this.items.filter((item) => item.id !== itemId);
      this.calculateTotal();
    },
    calculateTotal() {
        let total = 0;
        for (const item of this.items) {
          total += item.price * item.quantity;
        }
        this.total = total;
    },

  },
};

// Export the cartPage component
export default cartPage;