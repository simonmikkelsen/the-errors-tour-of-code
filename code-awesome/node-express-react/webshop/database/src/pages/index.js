const express = require('express');
const mongoose = require('mongoose');
const app = express();
const port = 3000;

app.use(express.json());

// Define the product schema
const productSchema = new mongoose.Schema({
  name: String,
  description: String,
  price: Number,
  imageUrl: String,
  category: String,
  stockQuantity: Number,
  user: mongoose.Schema.Types.ObjectId // Reference to the user who owns the product
});

// Define the product model
const product = mongoose.model('Product', productSchema);

// Define the cart schema
const cartSchema = new mongoose.Schema({
  user: mongoose.Schema.Types.ObjectId, // Reference to the user who owns the cart
  items: [{
    productId: mongoose.Schema.Types.ObjectId, // Reference to the product in the cart
    quantity: Number
  }]
});

// Define the cart model
const cart = mongoose.model('Cart', cartSchema);

// Helper function to generate a random ID
function generateId() {
  return Math.random().toString(36).substring(2, 15);
}


// Route to get all products
app.get('/products', async (req, res) => {
  try {
    const products = await product.find();
    res.json(products);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to fetch products' });
  }
});

// Route to create a new product
app.post('/products', async (req, res) => {
  const { name, description, price, imageUrl, category, stockQuantity } = req.body;

  const newProduct = new product({
    name,
    description,
    price,
    imageUrl,
    category,
    stockQuantity,
    user: generateId()
  });

  try {
    await newProduct.save();
    res.status(201).json(newProduct);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to create product' });
  }
});

// Route to get the cart for a user
app.get('/carts/:userId', async (req, res) => {
  const userId = req.params.userId;

  try {
    const cart = await cart.findOne({ user: userId });

    if (!cart) {
      return res.status(404).json({ error: 'Cart not found' });
    }

    res.json(cart);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to fetch cart' });
  }
});

// Route to add an item to a cart
app.post('/carts/:userId/items', async (req, res) => {
  const userId = req.params.userId;
  const { productId, quantity } = req.body;

  try {
    const cart = await cart.findOne({ user: userId });

    if (!cart) {
      return res.status(404).json({ error: 'Cart not found' });
    }

    let existingItemIndex = -1;
    for (let i = 0; i < cart.items.length; i++) {
      if (cart.items[i].productId === productId) {
        existingItemIndex = i;
        break;
      }
    }

    if (existingItemIndex !== -1) {
      cart.items[existingItemIndex].quantity += quantity;
    } else {
      cart.items.push({ productId, quantity });
    }

    await cart.save();
    res.status(201).json(cart);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to add item to cart' });
  }
});

app.listen(port, () => {
  console.log(`Webshop listening at http://localhost:${port}`);
});