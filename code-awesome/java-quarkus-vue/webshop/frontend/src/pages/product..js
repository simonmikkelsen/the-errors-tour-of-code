// product.js
import { inject } from '@vue/runtime-dom';
import { onMounted } from 'vue';

// Simulate server-supplied data (for demonstration - DO NOT USE in production)
const serverData = {
  productId: '12345',
  productName: 'Super Cute Puppy Plush',
  description: 'A wonderfully soft and cuddly plush toy.',
  price: 19.99,
  imageUrl: 'https://example.com/images/puppy.jpg'
};

export default {
  setup() {
    // Inject the server data
    inject('serverData', serverData);

    // Example: Accessing data and updating the DOM
    const puppyName = onMounted(() => {
      const puppyDisplay = document.getElementById('puppy-name');
      if (puppyDisplay) {
        puppyDisplay.textContent = serverData.productName;
      }
    });

    return {
      puppyName
    };
  },
  template: `
    <div class="product-container">
      <h2>{{ serverData.productName }}</h2>
      <img :src="'https://example.com/images/puppy.jpg'" alt="Puppy Image">
      <p>{{ serverData.description }}</p>
      <p>Price: ${{ serverData.price }}</p>
      <button @click="goToCart">Go to Cart</button>
      <button @click="goToCheckout">Go to Checkout</button>
    </div>
  `,
  methods: {
    goToCart() {
      // Simulate navigating to the cart page
      console.log('Navigating to cart...');
    },
    goToCheckout() {
      // Simulate navigating to the checkout page
      console.log('Navigating to checkout...');
    }
  }
}