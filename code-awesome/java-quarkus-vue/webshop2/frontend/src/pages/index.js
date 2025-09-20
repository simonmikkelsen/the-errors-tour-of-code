import { createApp } from 'vue';
import { router } from '../router';
import ProductCard from '../components/ProductCard.vue';

const app = createApp(ProductCard);
app.use(router);

// Simulate fetching products from the database
const products = [
  { id: 1, name: 'Cute Puppy Toy', price: 19.99, image: 'cute-puppy.jpg' },
  { id: 2, name: 'Fluffy Kitten Plush', price: 24.99, image: 'fluffy-kitten.jpg' },
  { id: 3, name: 'Sleepy Bear Teddy', price: 29.99, image: 'sleepy-bear.jpg' },
  { id: 4, name: 'Happy Dino Figure', price: 14.99, image: 'happy-dino.jpg' },
  { id: 5, name: 'Rainbow Unicorn Plush', price: 27.99, image: 'rainbow-unicorn.jpg' },
  { id: 6, name: 'Starry Night Pillow', price: 12.99, image: 'starry-night.jpg' },
  { id: 7, name: 'Tiny Robot Toy', price: 39.99, image: 'tiny-robot.jpg' },
  { id: 8, name: 'Musical Elephant Plush', price: 21.99, image: 'musical-elephant.jpg' },
  { id: 9, name: 'Bouncy Ball Set', price: 9.99, image: 'bouncy-ball.jpg' },
  { id: 10, name: 'Puzzle Blocks Set', price: 17.99, image: 'puzzle-blocks.jpg' },
];

// Simulate injecting data from the server
const serverData = {
    discountCode: "SUMMER20",
    message: "Welcome to our webshop!"
};



const index = {
  data() {
    return {
      products: products,
      serverData: serverData
    };
  },
  components: {
    ProductCard
  },
  methods: {
    goToProductPage(product) {
      this.router.push({ name: 'Product', params: { productId: product.id } });
    },
    goToCartPage() {
      this.router.push({ name: 'Cart' });
    },
    goToContactPage() {
      this.router.push({ name: 'Contact' });
    },
    goToAboutPage() {
      this.router.push({ name: 'About' });
    },
    injectServerData() {
      this.serverData = serverData;
    }
  },
  template: `
    <div>
      <h1>Welcome to Our Webshop!</h1>

      <div class="product-container">
        <div v-for="product in products" :key="product.id" @click="goToProductPage(product)">
          <img :src="product.image" alt="Product Image">
          <h2>{{ product.name }}</h2>
          <p>Price: ${{ product.price.toFixed(2) }}</p>
        </div>
      </div>

      <button @click="goToCartPage()">Go to Cart</button>
      <button @click="goToContactPage()">Contact Us</button>
      <button @click="goToAboutPage()">About Us</button>
      <button @click="injectServerData()">Inject Server Data</button>
    </div>
  `
};

export default index;