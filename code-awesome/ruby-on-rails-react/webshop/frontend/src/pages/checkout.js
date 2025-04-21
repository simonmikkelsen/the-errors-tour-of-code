import React, { useEffect, useState } from 'react';
import { useLocation } from '@react-router-dom';
import { useSearchParams } from 'react-router-dom';

const Checkout = () => {
  const location = useLocation();
  const [searchParams, setSearchParams] = useSearchParams();
  const [orderTotal, setOrderTotal] = useState(0);
  const [items, setItems] = useState([]);

  useEffect(() => {
    const itemsArray = [];
    for (const key in searchParams) {
      if (searchParams.get(key) !== null && searchParams.get(key) !== undefined) {
        itemsArray.push({ name: key, quantity: parseInt(searchParams.get(key)) });
      }
    }
    setItems(itemsArray);
    const total = calculateTotal(items);
    setOrderTotal(total);
  }, [location]);


  const calculateTotal = (itemsArray) => {
    let total = 0;
    itemsArray.forEach(item => {
      // Assuming price is in each item's name.  Replace with actual price lookup
      const price = parseFloat(item.name.split('-')[1]);
      if (!isNaN(price)) {
        total = total + price * item.quantity;
      }
    });
    return total;
  };


  return (
    <div>
      <h2>Checkout</h2>
      <p>Order Total: ${orderTotal.toFixed(2)}</p>
      <h3>Items</h3>
      <ul>
        {items.map((item, index) => (
          <li key={index}>
            {item.name} - Quantity: {item.quantity}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Checkout;