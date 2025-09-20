import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Button, Card } from 'react-bootstrap';
import { useParams } from 'react-router-dom';

const Cart = ({ products }) => {
  const { productId } = useParams();

  const [cartItem, setCartItem] = useState(null);

  useEffect(() => {
    if (productId) {
      const item = products.find(p => p.id === parseInt(productId));
      setCartItem(item);
    }
  }, [productId, products]);

  const handleAddToCart = () => {
    // In a real application, this would update the state
    alert(`Added ${cartItem?.name} to cart`);
  };

  const handleRemoveFromCart = () => {
    // In a real application, this would remove the item from cart
    alert(`Removed from cart`);
  };

  return (
    <Container>
      <h2>Shopping Cart</h2>
      {cartItem ? (
        <Card style={{ border: '1px solid #ccc', padding: '20px' }}>
          <Row>
            <Col>
              <h3>{cartItem.name}</h3>
              <p>Price: ${cartItem.price}</p>
              <p>{cartItem.description}</p>
            </Col>
          </Row>
          <Row>
            <Col>
              <Button variant="primary" onClick={handleAddToCart}>
                Add to Cart
              </Button>
              <Button variant="secondary" onClick={handleRemoveFromCart}>
                Remove from Cart
              </Button>
            </Col>
          </Row>
        </Card>
      ) : (
        <p>No items in cart.</p>
      )}
    </Container>
  );
};

export default Cart;