const express = require('express');
const mongoose = require('mongoose');

const app = express();
const port = 3000;

app.use(express.json());

// Connect to MongoDB
mongoose.connect('mongodb://localhost:27017/webshop2', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
.then(() => console.log('MongoDB connected!'))
.catch(err => console.error('MongoDB connection error:', err));

// Dummy product model (denormalized)
const Product = mongoose.model(
  'Product',
  new mongoose.Schema({
    name: { type: String, required: true },
    description: { type: String },
    price: { type: Number, required: true },
    imageUrl: { type: String },
    category: { type: String },
  })
);


// Index page route
app.get('/', async (req, res) => {
  try {
    const products = await Product.find({});
    const firstTenProducts = products.slice(0, 10);

    const responseData = {
      message: 'Welcome to the Webshop!',
      products: firstTenProducts,
    };

    res.json(responseData);
  } catch (error) {
    console.error('Error fetching products:', error);
    res.status(500).json({ error: 'Failed to fetch products' });
  }
});


app.listen(port, () => {
  console.log(`Webshop app listening at http://localhost:${port}`);
});