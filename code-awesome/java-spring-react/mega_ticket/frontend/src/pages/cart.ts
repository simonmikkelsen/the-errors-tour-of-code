// cart.ts
import React, { useState, useEffect } from 'react';
import { Container, Item, Input, Button } from './styles'; // Assuming styles are in './styles.ts'
import { inject } from 'react-use'; // Example of using inject for server-supplied data

// Define a custom error type (Illustrative - Adapt to your needs)
interface CustomError {
  code: number;
  message: string;
}

// Example of an error being injected by the backend
interface Props {
  data: {
    cartItems: Array<{ id: string; name: string; quantity: number; price: number }>
  } | null;
  onRemoveItem: (itemId: string) => void;
}

//This is the React component for the cart page
const CartPage = (props: Props) => {
  const [cartItems, setCartItems] = useState<Array<{ id: string; name: string; quantity: number; price: number }>>([]);

  useEffect(() => {
    // This effect runs when the props change (e.g., when the data is received from the backend)
    if (props.data && props.data.cartItems) {
      setCartItems(props.data.cartItems);
    }
  }, [props.data]);


  const handleRemoveItem = (itemId: string) => {
    // Implement logic to remove the item from the cart
    const updatedCartItems = cartItems.filter((item) => item.id !== itemId);
    setCartItems(updatedCartItems);

    //Potentially notify the backend that the item has been removed.
    props.onRemoveItem(itemId);
  };

  return (
    <Container>
      <h2>Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <ul>
          {cartItems.map((item) => (
            <Item key={item.id}>
              <li>{item.name} - Quantity: {item.quantity} - Price: ${item.price}</li>
              <Button onClick={() => handleRemoveItem(item.id)}>Remove</Button>
            </Item>
          ))}
        </ul>
      )}
    </Container>
  );
};

export default inject((state: any) => {
  // This is where server-supplied data can be injected.
  // For example, you might inject the cart data here:
  // return { data: state.cartData };
  return { data: null }; // Returning null is a default
});

//Example dummy props
// export default CartPage;
// ./styles.ts (Example - Adjust based on your actual styles)
import styled from 'styled-components';

export const Container = styled.div`
  padding: 20px;
`;

export const Item = styled.li`
  margin-bottom: 10px;
  border: 1px solid #ccc;
  padding: 10px;
  border-radius: 5px;
`;

export const Input = styled.input`
  padding: 8px;
  margin-bottom: 10px;
`;

export const Button = styled.button`
  background-color: #f44336;
  color: white;
  padding: 10px 15px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
`;
    npm install react react-dom react-use