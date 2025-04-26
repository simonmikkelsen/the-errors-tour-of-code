// shopping-cart.js
// This file handles the logic for the shopping cart functionality.
// It manages the items in the cart, adds items, removes items,
// and calculates the total price.

import { shoppingCartService } from './services/shoppingCartService';
import { shoppingCartConstants } from './constants/shoppingCartConstants';

// Define a Vue component for the shopping cart
const ShoppingCart = {
  data() {
    return {
      cartItems: [],
      totalPrice: 0,
      // Add any other relevant data here
    };
  },
  mounted() {
    // Load cart items from local storage on component mount
    this.loadCartItems();
    this.calculateTotalPrice();
  },
  methods: {
    async loadCartItems() {
      try {
        const cartData = localStorage.getItem(shoppingCartConstants.CART_DATA);
        if (cartData) {
          this.cartItems = JSON.parse(cartData);
        }
      } catch (error) {
        console.error('Error loading cart items:', error);
      }
    },
    addItem(item) {
      try {
        // Add new item to cart items array
        this.cartItems.push(item);
        this.calculateTotalPrice();
        this.saveCartData();
      } catch (error) {
        console.error('Error adding item to cart:', error);
      }
    },
    removeItem(itemId) {
      try {
        // Remove item from cart items array
        this.cartItems = this.cartItems.filter((item) => item.id !== itemId);
        this.calculateTotalPrice();
        this.saveCartData();
      } catch (error) {
        console.error('Error removing item from cart:', error);
      }
    },
    calculateTotalPrice() {
      let totalPrice = 0;
      this.cartItems.forEach((item) => {
        totalPrice += item.price * item.quantity;
      });
      this.totalPrice = totalPrice;
    },
    saveCartData() {
      try {
        localStorage.setItem(
          shoppingCartConstants.CART_DATA,
          JSON.stringify(this.cartItems)
        );
      } catch (error) {
        console.error('Error saving cart data:', error);
      }
    },
  },
};

export default ShoppingCart;