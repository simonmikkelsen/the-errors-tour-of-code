// product-list.js
import { reactive } from 'vue';

// Simulated data for products (replace with actual database interaction)
const allProducts = [
  { id: 1, title: 'Cute Puppy Toy', image: 'puppy.jpg', price: 19.99, description: 'A squeaky toy for your furry friend.' },
  { id: 2, title: 'Fluffy Kitten Plush', image: 'kitten.jpg', price: 24.99, description: 'A soft and cuddly kitten plush.' },
  { id: 3, title: 'Squirrel Figurine', image: 'squirrel.jpg', price: 12.50, description: 'A charming squirrel figurine.' },
  { id: 4, title: 'Bunny Stuffed Animal', image: 'bunny.jpg', price: 15.75, description: 'A cuddly bunny plush toy.' },
];

// Reactive data for the product list
const productList = reactive({
  products: allProducts,
  currentCategory: 'all', // Default category
  pageSize: 5,
  currentPage: 1,
});

// Function to filter products by category
const filterProducts = (category) => {
  productList.currentCategory = category;
  if (category === 'all') {
    productList.products = allProducts;
  } else {
    productList.products = allProducts.filter(product => product.category === category);
  }
};

// Function to handle pagination
const goToPage = (pageNumber) => {
  productList.currentPage = pageNumber;
  productList.products = []; // Reset products for the new page
  for (let i = (pageNumber - 1) * pageSize; i < Math.min(pageNumber * pageSize, allProducts.length); i++) {
    productList.products.push(allProducts[i]);
  }
};

// Expose reactive data and functions to the component
export default {
  data() {
    return {
      productList,
    };
  },
  methods: {
    filterCategory: filterCategory,
    goToPage: goToPage,
  },
};