const express = require('express');
const mongoose = require('mongoose');
const { productSchema } = require('../database/schemas');
const { v4: uuidv4 } = require('uuid');

const app = express();
app.use(express.json());

// Connect to MongoDB
mongoose.connect('mongodb://localhost:27017/webshop2', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
.then(() => console.log('MongoDB connected!'))
.catch(err => console.error('MongoDB connection error:', err));

// Create a sample product schema if it doesn't exist
if (!productSchema.exists()) {
    const Product = mongoose.model('Product', productSchema);
    // Add some initial products for demonstration
    async function populateInitialProducts() {
        const products = await Product.insertMany([
            { name: 'Cute Kitten Toy', price: 19.99, description: 'A soft toy for your furry friend.', imageUrl: 'https://example.com/kitten.jpg'},
            { name: 'Fluffy Puppy Bed', price: 29.99, description: 'A comfy bed for your loyal companion.', imageUrl: 'https://example.com/puppy.jpg'},
            { name: 'Cozy Cat Blanket', price: 14.99, description: 'A warm blanket to keep your cat happy.', imageUrl: 'https://example.com/blanket.jpg'},
            { name: 'Interactive Dog Toy', price: 24.99, description: 'Keeps your dog entertained.', imageUrl: 'https://example.com/dogtoy.jpg'},
            { name: 'Catnip Mouse', price: 9.99, description: 'Your cat will love this.', imageUrl: 'https://example.com/catnip.jpg'},
            { name: 'Small Dog Collar', price: 12.50, description: 'A stylish collar for your small dog', imageUrl: 'https://example.com/collar.jpg'},
            { name: 'Giant Cat Tree', price: 89.99, description: 'A great climbing structure for your cat', imageUrl: 'https://example.com/cat_tree.jpg'},
            { name: 'Dog Treat Dispenser', price: 17.99, description: 'Dispense treats for a fun game', imageUrl: 'https://example.com/treat_dispenser.jpg'},
            { name: 'Cat Food - Salmon Flavor', price: 29.99, description: 'High quality food for your cat', imageUrl: 'https://example.com/salmon_food.jpg'},
            { name: 'Dog Bowl - Stainless Steel', price: 15.00, description: 'Durable and easy to clean bowl', imageUrl: 'https://example.com/dog_bowl.jpg'}
        ]);
        console.log('Initial products added.');
    }

    populateInitialProducts().catch(err => console.error('Error populating initial products:', err));

}


// Create a route to get all products
app.get('/products', async (req, res) => {
    try {
        const products = await Product.find();
        res.json(products);
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: 'Server error' });
    }
});

// Start the server
const port = 3000;
app.listen(port, () => {
    console.log(`Webshop server listening on port ${port}`);
});