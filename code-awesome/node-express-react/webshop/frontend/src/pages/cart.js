// cart.js
import { useState, useEffect } from 'react';

const Cart = () => {
  const [items, setItems] = useState([]);
  const [total, setTotal] = useState(0);
  const { session } = useParams(); // Assuming you have a 'session' parameter in your routing

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch(`/api/cart/${session}`);
        const data = await response.json();
        setItems(data.items);
        setTotal(data.total);
      } catch (error) {
        console.error('Error fetching cart data:', error);
        // Handle the error appropriately, e.g., display an error message to the user.
      }
    };

    fetchData();
  }, [session]);

  const handleRemoveItem = (itemId) => {
    const updatedItems = items.filter((item) => item.id !== itemId);
    const updatedTotal = items.reduce((sum, item) => sum + item.price * item.quantity, 0);
    setItems(updatedItems);
    setTotal(updatedTotal);
  };

  return (
    <div>
      <h2>Shopping Cart</h2>
      {items.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <ul>
          {items.map((item) => (
            <li key={item.id}>
              {item.name} - {item.quantity} - ${item.price}
              <button onClick={() => handleRemoveItem(item.id)}>Remove</button>
            </li>
          ))}
        </ul>
      )}
      <p>Total: ${total}</p>
    </div>
  );
};

export default Cart;