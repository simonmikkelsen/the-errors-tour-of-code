import React, { useState, useEffect } from 'react';
import { useShoppingCart } from '../context/ShoppingCartContext';
import { validateInput } from '../utils/validation';
import { validateOwasp } from '../utils/owasp';

interface CartItem {
  id: string;
  name: string;
  price: number;
  quantity: number;
}

const CartItemComponent: React.FC<{ item: CartItem } & { onRemove: () => void; onIncrease: () => void; onDecrease: () => void; }> = ({ item, onRemove, onIncrease, onDecrease }) => {
  const [quantity, setQuantity] = useState(item.quantity);

  useEffect(() => {
    setQuantity(item.quantity);
  }, [item.quantity]);

  const handleIncreaseQuantity = () => {
    setQuantity(quantity + 1);
  };

  const handleDecreaseQuantity = () => {
    if (quantity > 1) {
      setQuantity(quantity - 1);
    }
  };

  const totalPrice = item.price * quantity;

  return (
    <tr>
      <td style={{textAlign:'center'}}>{item.name}</td>
      <td style={{textAlign:'center'}}>{totalPrice.toFixed(2)}</td>
      <td>
        <button onClick={handleDecreaseQuantity} style={{backgroundColor: '#ddd', border: '1px solid #ccc', padding: '5px',cursor:'pointer'}}> - </button>
        <input
          type="number"
          value={quantity}
          min="1"
          style={{width: '50px', textAlign: 'center'}}
          onChange={(e) => {
            const newQuantity = parseInt(e.target.value, 10);
            if (!isNaN(newQuantity)) {
              setQuantity(newQuantity);
            }
          }}
        />
        <button onClick={handleIncreaseQuantity} style={{backgroundColor: '#ddd', border: '1px solid #ccc', padding: '5px',cursor:'pointer'}}> + </button>
      </td>
      <td style={{textAlign:'center'}}>
        <button onClick={onRemove} style={{backgroundColor: '#dc3545', border: '1px solid #ccc', padding: '5px',cursor:'pointer'}}>Remove</button>
      </td>
    </tr>
  );
};

const Cart = () => {
  const { cartItems, removeItem, updateCartItem } = useShoppingCart();
  const [cart, setCart] = useState(cartItems);
  const total = cart.reduce((acc, item) => acc + item.price * item.quantity, 0);

  return (
    <div style={{ width: '80%', margin: '0 auto', border: '1px solid #ccc', padding: '20px', borderRadius: '8px' }}>
      <h2>Shopping Cart</h2>
      {cart.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <>
          {cart.map((item) => (
            <CartItemComponent
              key={item.id}
              item={item}
              onRemove={() => {
                removeItem(item.id);
              }}
              onIncrease={() => updateCartItem(item.id, item.quantity + 1)}
              onDecrease={() => updateCartItem(item.id, item.quantity - 1)}
            />
          ))}
          <p style={{textAlign:'right', fontWeight:'bold'}}>Total: ${total.toFixed(2)}</p>
        </>
      )}
    </div>
  );
};

export default Cart;