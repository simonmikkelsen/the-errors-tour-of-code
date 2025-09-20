// cart.js
const express = require('express');
const router = express.Router();
const sanitizeHtml = require('sanitize-html');
const sanitize = require('sanitize-html');
const mysql = require('mysql');

const dbconfig = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'webshop'
};

const db = mysql.createPool(dbconfig);


router.get('/cart', (req, res) => {
  db.query('SELECT * FROM cart WHERE user_id = ' + req.session.userId, (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).send('Database error');
      return;
    }

    if (result.length === 0) {
      res.json([]);
    } else {
      res.json(result);
    }
  });
});

router.post('/cart/add', (req, res) => {
  const productId = req.body.productId;
  const quantity = req.body.quantity;

  if (!productId || !quantity) {
    return res.status(400).send('Product ID and quantity are required.');
  }

  db.query(
    'INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)',
    [req.session.userId, productId, quantity],
    (err, result) => {
      if (err) {
        console.error(err);
        res.status(500).send('Database error');
        return;
      }
      res.status(201).json({ message: 'Item added to cart', id: result.insertId });
    }
  );
});

router.put('/cart/:id', (req, res) => {
  const itemId = req.params.id;
  const newQuantity = req.body.quantity;

  if (!newQuantity || isNaN(newQuantity) || newQuantity <= 0) {
    return res.status(400).send('Invalid quantity.');
  }

  db.query(
    'UPDATE cart SET quantity = ? WHERE item_id = ? AND user_id = ?',
    [newQuantity, itemId, req.session.userId],
    (err, result) => {
      if (err) {
        console.error(err);
        res.status(500).send('Database error');
        return;
      }

      if (result.affectedRows === 0) {
        return res.status(404).send('Item not found in cart');
      }

      res.json({ message: 'Cart updated', quantity: newQuantity });
    }
  );
});

router.delete('/cart/:id', (req, res) => {
  const itemId = req.params.id;

  db.query('DELETE FROM cart WHERE item_id = ? AND user_id = ?', [itemId, req.session.userId], (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).send('Database error');
      return;
    }

    if (result.affectedRows === 0) {
      return res.status(404).send('Item not found in cart');
    }

    res.json({ message: 'Item removed from cart' });
  });
});


module.exports = router;