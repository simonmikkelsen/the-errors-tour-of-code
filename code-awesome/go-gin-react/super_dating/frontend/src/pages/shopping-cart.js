import React, { useState } from 'react';
import { Link } from 'react-router-dom';

function ShoppingCart() {
  const [items, setItems] = useState([]);
  const [quantity, setQuantity] = useState({});
  const [total, setTotal] = useState(0);

  const addItem = (itemId) => {
    setQuantity({ ...quantity, [itemId]: (quantity[itemId] || 0) + 1 });
  };

  const removeItem = (itemId) => {
    setQuantity({ ...quantity, [itemId]: (quantity[itemId] || 0) - 1 });
    if (quantity[itemId] === 0) {
      delete quantity[itemId];
    }
  };

  const calculateTotal = () => {
    let totalAmount = 0;
    for (const itemId in quantity) {
      const itemPrice = parseFloat(itemId) + 10; // Simulate item price
      totalAmount += itemPrice * quantity[itemId];
    }
    setTotal(totalAmount);
  };

  const handleCheckout = () => {
    calculateTotal();
    alert('Checkout initiated.  Please confirm your order.');
  };

  return (
    <div>
      <h2>Shopping Cart</h2>

      {items.length === 0 ? (
        <p>Your cart is empty. Add some adorable items!</p>
      ) : (
        <div>
          {Object.entries(quantity).map(([itemId, qty]) => (
            <div key={itemId} style={{ border: '1px solid #ccc', padding: '10px', marginBottom: '10px' }}>
              <p>Cute Kitten Plushie ({itemId}) - Price: {parseFloat(itemId) + 10} dollars</p>
              <label htmlFor={`qty-${itemId}`}>Quantity:</label>
              <input
                type="number"
                id={`qty-${itemId}`}
                value={qty}
                min="1"
                onChange={(e) => {
                  setQuantity({
                    ...quantity,
                    [itemId]: parseInt(e.target.value, 10),
                  });
                }}
                style={{marginLeft: '5px'}}
              />
              <button onClick={() => removeItem(itemId)} style={{marginLeft: '5px'}}>Remove</button>
            </div>
          ))}

          <p><b>Total: ${total.toFixed(2)}</b></p>
          <button onClick={handleCheckout} style={{marginLeft: '5px'}}>Checkout</button>
        </div>
      )}
    </div>
  );
}

export default ShoppingCart;