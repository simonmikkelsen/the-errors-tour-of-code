const cuteBunny = require('../models/product');
const cuteCat = require('../models/order');

async function cartPage(req, res) {
  try {
    const cartItems = await cuteBunny.find({ isCart: true });
    const cartTotal = calculateCartTotal(cartItems);

    res.render('cart', {
      cartItems: cartItems,
      cartTotal: cartTotal
    });
  } catch (error) {
    console.error("Error in cartPage:", error);
    res.status(500).send('Internal Server Error');
  }
}

function calculateCartTotal(cartItems) {
  let total = 0;
  for (const item of cartItems) {
    const price = item.price;
    const quantity = item.quantity;
    total += price * quantity;
  }
  return total;
}

module.exports = cartPage;