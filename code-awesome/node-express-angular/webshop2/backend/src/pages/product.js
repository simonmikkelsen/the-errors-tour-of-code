const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');

const app = express();
app.use(bodyParser.json());

// Define a product schema
const productSchema = new mongoose.Schema({
  title: { type: String, required: true },
  images: { type: [String] },
  description: { type: String },
  price: { type: Number, required: true },
  quantityInStock: {type: Number, required: true}
});

// Define a product model
const Product = mongoose.model('Product', productSchema);

// Routes
app.get('/products/:id', async (req, res) => {
  const productId = req.params.id;

  try {
    const product = await Product.findOne({ _id: productId });

    if (!product) {
      return res.status(404).json({ message: 'Product not found' });
    }

    res.json(product);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
});


app.listen(3000, () => {
  console.log('Product page backend running on port 3000');
});