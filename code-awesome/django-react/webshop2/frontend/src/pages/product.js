import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Card, Button, Image } from 'react-bootstrap';

const Product = ({ product }) => {
  const [cartItems, setCartItems] = useState([]);
  const [productCount, setProductCount] = useState(1);

  useEffect(() => {
    // Simulate fetching cart items from localStorage or database
    const storedCartItems = localStorage.getItem('cartItems') ? JSON.parse(localStorage.getItem('cartItems')) : [];
    setCartItems(storedCartItems);
  }, []);

  const handleAddToCart = () => {
    const existingItemIndex = cartItems.findIndex(item => item.productId === product.id);

    if (existingItemIndex !== -1) {
      setCartItems(
        cartItems.map((item) =>
          item.productId === product.id ? { ...item, quantity: item.quantity + 1 } : item
        )
      );
    } else {
      setCartItems([...cartItems, { productId: product.id, quantity: 1 }]);
    }
  };

  const handleQuantityChange = (event) => {
    setProductCount(parseInt(event.target.value, 10));
  }

  const handleUpdateCart = () => {
    const updatedCart = cartItems.map((item) => {
      if (item.productId === product.id) {
        return { ...item, quantity: productCount };
      }
      return item;
    });
    setCartItems(updatedCart);
  };

  const handleRemoveFromCart = () => {
    const updatedCart = cartItems.filter((item) => item.productId !== product.id);
    setCartItems(updatedCart);
  };


  return (
    <Container>
      <Row>
        <Col xs={12} md={6}>
          <Card>
            <Card.Body>
              <Image src={product.imageUrl} alt={product.title} fluid rounded />
              <Card.Title>{product.title}</Card.Title>
              <Card.Text>
                {product.description}
              </Card.Text>
              <Button variant="primary" onClick={handleAddToCart} className="mt-3">Add to Cart ({productCount})</Button>
            </Card.Body>
          </Card>
        </Col>
        <Col xs={12} md={6}>
          <Card>
            <Card.Body>
              <Card.Title>Price: ${product.price}</Card.Title>
              <Button variant="secondary" onClick={() => handleUpdateCart}>Update Cart</Button>
              <Button variant="danger" onClick={handleRemoveFromCart}>Remove from Cart</Button>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
};

export default Product;