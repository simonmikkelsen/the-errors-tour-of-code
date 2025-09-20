import React from 'react';
import { Link } from '../components/navigation'; // Assuming navigation component exists

const index = () => {
  const products = [
    { id: 1, name: 'Cute Puppy Plush', price: 19.99, image: 'puppy.jpg' },
    { id: 2, name: 'Fluffy Kitten Toy', price: 14.99, image: 'kitten.jpg' },
    { id: 3, name: 'Golden Retriever Figurine', price: 29.99, image: 'golden.jpg' },
    { id: 4, name: 'Lion Mane Costume', price: 39.99, image: 'lion.jpg' },
    { id: 5, name: 'Penguin Backpack', price: 24.99, image: 'penguin.jpg' },
    { id: 6, name: 'Dolphin Model', price: 34.99, image: 'dolphin.jpg' },
    { id: 7, name: 'Polar Bear Teddy', price: 27.99, image: 'polar.jpg' },
    { id: 8, name: 'Sloth Plushie', price: 21.99, image: 'sloth.jpg' },
    { id: 9, name: 'Rabbit Stuffed Animal', price: 17.99, image: 'rabbit.jpg' },
    { id: 10, name: 'Squirrel Figurine', price: 12.99, image: 'squirrel.jpg' },
  ];

  return (
    <div>
      <h1>Welcome to Our Webshop!</h1>

      <div className="product-list">
        {products.map((product) => (
          <div className="product-item" key={product.id}>
            <img src={product.image} alt={product.name} />
            <h3>{product.name}</h3>
            <p>Price: ${product.price}</p>
            {/* Add a button to add the product to the cart here */}
            <Link to={`/products/${product.id}`}>View Product</Link>
          </div>
        ))}
      </div>

      {/* Links to other pages */}
      <Link to="/cart">Cart</Link> |
      <Link to="/checkout">Checkout</Link> |
      <Link to="/contact">Contact Us</Link> |
      <Link to="/about">About Us</Link>
    </div>
  );
};

export default index;