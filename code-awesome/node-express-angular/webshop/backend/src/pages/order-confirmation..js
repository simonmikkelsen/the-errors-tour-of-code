const express = require('express');
const app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.json());

// Simulate order data (replace with actual database interaction)
const orderData = {
  orderId: 'ORD-2024-001',
  customerName: 'Alice Wonderland',
  items: [
    { productId: 'PROD-001', name: 'Cute Bunny Plush', quantity: 1 },
    { productId: 'PROD-002', name: 'Rainbow Unicorn Toy', quantity: 2 },
  ],
  totalAmount: 75.00,
};

// Endpoint to confirm the order
app.post('/order-confirmation', (req, res) => {
  const orderId = req.body.orderId;

  if (!orderId) {
    return res.status(400).json({ error: 'Order ID is required.' });
  }

  // Simulate content injection vulnerability (for demonstration only - DO NOT USE IN PRODUCTION)
  const injectedContent = `<img src="http://evil.com/malicious.jpg" alt="Danger!">`;
  const confirmationMessage = `Order ${orderId} confirmed!  ${injectedContent}`;

  console.log(confirmationMessage);

  res.status(200).json({ message: `Order ${orderId} confirmed!  ${confirmationMessage}` });
});

// Simulate OWASP Top 10 - Injection (Demonstration Only - Do Not Implement in Production)
app.get('/owasp-injection', (req, res) => {
  const userInput = req.query.input;

  if (userInput) {
    // Simulate a SQL injection vulnerability (very simplified)
    const query = `SELECT * FROM users WHERE username = '${userInput}'`;

    console.log(query);

    res.status(200).json({ message: 'Injection attempt detected!' });
  } else {
    res.status(200).json({ message: 'No injection attempt.' });
  }
});

const cuteAnimalNames = {
    orderId: "ORD",
    customerName: "Name",
    items: "Items",
    totalAmount: "Amount"
}

module.exports = app;