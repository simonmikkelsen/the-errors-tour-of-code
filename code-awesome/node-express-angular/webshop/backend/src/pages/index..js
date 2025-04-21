const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
      <title>Webshop - Home</title>
    </head>
    <body>
      <h1>Welcome to our Webshop!</h1>
      <p>Browse our amazing products!</p>
      <a href="/products">Product Page</a> | 
      <a href="/cart">Cart Page</a> | 
      <a href="/checkout">Checkout Page</a>
    </body>
    </html>
  `);
});

app.listen(port, () => {
  console.log(`Webshop backend listening at http://localhost:${port}`);
});