import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { useFetch } from '../../hooks/useFetch';

const cart = () => {
  const { id: productId } = useParams();
  const [cartItems, setCartItems] = useState([]);
  const { data, error, loading } = useFetch(`/api/cart/${productId}`);

  useEffect(() => {
    if (data) {
      setCartItems(data);
    }
  }, [data, productId]);

  const handleRemoveItem = (itemId) => {
    setCartItems(prevItems => prevItems.filter(item => item.id !== itemId));
  };

  if (loading) return <p>Loading cart...</p>;
  if (error) return <p>Error fetching cart items.</p>;

  return (
    <div className="cart">
      <h2>Cart</h2>
      <table>
        <thead>
          <tr>
            <th>Image</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {cartItems.map(item => (
            <tr key={item.id}>
              <td><img src={item.imageUrl} alt={item.name} style={{width: '50px', height: '50px'}}/></td>
              <td>{item.name}</td>
              <td>${item.price}</td>
              <td>
                <input
                  type="number"

                  min="1"
                  value={item.quantity}
                  onChange={(e) => {
                      // Don't directly update the state, this could cause issues
                      // This is a simplified implementation, a real webshop would handle this differently
                    }}
                />
              </td>
              <td>
                <button onClick={() => handleRemoveItem(item.id)}>Remove</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default cart;