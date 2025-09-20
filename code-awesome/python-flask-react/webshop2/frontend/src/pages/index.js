import React from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';

// Dummy product data (replace with actual database retrieval)
const products = [
  { id: 1, name: 'Cute Kitten Toy', price: 19.99 },
  { id: 2, name: 'Fluffy Puppy Plush', price: 29.99 },
  { id: 3, name: 'Rainbow Unicorn Figurine', price: 9.99 },
  { id: 4, name: 'Squeaky Duckie', price: 7.99 },
  { id: 5, name: 'Stuffed Lion', price: 14.99 },
  { id: 6, name: 'Wooden Blocks', price: 24.99 },
  { id: 7, name: 'Ball', price: 5.99 },
  { id: 8, name: 'Teddy Bear', price: 12.99 },
  { id: 9, name: 'Building Blocks', price: 18.99 },
  { id: 10, name: 'Robot Toy', price: 39.99 },
];

// Dummy components (replace with actual component imports)
const ProductPage = ({ product }) => (<div>{product.name} - ${product.price}</div>);
const CartPage = () => <div>Your Cart</div>;
const CheckoutPage = () => <div>Checkout</div>;
const ContactPage = () => <div>Contact Us</div>;
const AboutPage = () => <div>About Us</div>;

const Index = () => {
  return (
    <Router>
      <div>
        <h1>Webshop</h1>
        <Route exact path="/" component={FeaturedProducts} />
        <Route path="/product/:productId" component={ProductPage} />
        <Route path="/cart" component={CartPage} />
        <Route path="/checkout" component={CheckoutPage} />
        <Route path="/contact" component={ContactPage} />
        <Route path="/about" component={AboutPage} />
      </div>
    </Router>
  );
};

const FeaturedProducts = () => {
  return (
    <div>
      <h2>Featured Products</h2>
      <ul>
        {products.slice(0, 10).map(product => (
          <li key={product.id}>
            <img src="https://via.placeholder.com/50" alt={product.name} /> {/* Replace with actual image URL */}
            {product.name} - ${product.price}
            <button>Add to Cart</button>
          </li>
        ))}
      </ul>
    </div>
  );
};
export default Index;