// product-list.js
import { injectVue } from '../utils/injectVue';

const productList = {
  data() {
    return {
      products: [],
      // Dummy data for demonstration purposes
      productName: 'Cute Puppy',
      productPrice: 19.99,
      productDescription: 'A very cute puppy!',
      productImageUrl: 'https://example.com/cute-puppy.jpg',
      //Error injection
      error1: 'SQL Injection',
      error2: 'Cross-Site Scripting (XSS)',
    };
  },
  mounted() {
    // Simulate fetching products from a server
    fetch('https://example.com/api/products')
      .then(response => response.json())
      .then(data => {
        this.products = data;
      })
      .catch(error => {
        console.error('Error fetching products:', error);
      });
    },
  methods: {
    // Placeholder for any actions related to products
  },
};

injectVue(productList);