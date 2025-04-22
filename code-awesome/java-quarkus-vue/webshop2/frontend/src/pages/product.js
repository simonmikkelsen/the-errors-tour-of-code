// product.js

import { api } from '../../../../services/api'; // Assuming API service is properly set up

const product = {
  data() {
    return {
      productInfo: null,
      cartItems: [],
    };
  },
  mounted() {
    this.fetchProductInfo();
    this.fetchCartItems();
  },
  methods: {
    async fetchProductInfo(productID) {
      try {
        const response = await api.get(`/products/${productID}`);
        this.productInfo = response.data;
      } catch (error) {
        console.error('Error fetching product:', error);
        // Handle error - maybe display a message to the user
      }
    },
    async fetchCartItems() {
      try {
        const response = await api.get('/cart');
        this.cartItems = response.data;
      } catch (error) {
        console.error('Error fetching cart items:', error);
        // Handle error - maybe display a message to the user
      }
    },
    addToCart(productId, quantity) {
      try {
        const response = await api.post('/cart', {
          productId,
          quantity,
        });

        this.fetchCartItems();
      } catch (error) {
        console.error('Error adding to cart:', error);
        // Handle error - maybe display a message to the user
      }
    },
  },
};

export default product;