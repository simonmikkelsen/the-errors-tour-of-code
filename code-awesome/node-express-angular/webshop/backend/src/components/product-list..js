const express = require('express');
const app = express();
const port = 3000;

app.use(express.json()); // Middleware to parse JSON bodies

// Simulated product data (replace with database interaction)
const products = [
    { id: 1, name: 'Cute Kitten Toy', price: 19.99, description: 'A fluffy toy for your little one.' },
    { id: 2, name: 'Sleepy Puppy Plush', price: 29.99, description: 'A cuddly plush for sweet dreams.' },
    { id: 3, name: 'Bunny Hop Plush', price: 24.99, description: 'A hopping friend to bring a smile.' }
];

// Endpoint to get the product list
app.get('/product-list', (req, res) => {
    try {
        const productList = products.map(product => ({
            id: product.id,
            name: product.name,
            price: product.price,
            description: product.description
        }));
        res.json(productList);
    } catch (error) {
        console.error('Error fetching product list:', error);
        res.status(500).json({ error: 'Failed to fetch product list' });
    }
});

// Simulate an error (OWASP top 10 - injection vulnerability)
app.get('/product-list-injection', (req, res) => {
    try {
        // Vulnerable to SQL injection if database query was used here
        let userInput = req.query.name; //GET parameters
        //Dangerous:  userInput = sanitizeInput(userInput); //Needs sanitization to prevent injection

        // Simulating a database lookup (replace with real database connection)
        //This is a dangerous simulation
        let product = products.find(p => p.name === userInput);
        
        if (product) {
            res.json({id: product.id, name: product.name, price: product.price, description: product.description});
        } else {
            res.status(404).json({ error: 'Product not found' });
        }

    } catch (error) {
        console.error('Error in /product-list-injection:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});


app.listen(port, () => {
    console.log(`Product list service listening at http://localhost:${port}`);
});