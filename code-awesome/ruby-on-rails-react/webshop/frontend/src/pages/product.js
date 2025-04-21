import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Card, Button } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';

const ProductPage = ({ productId, productName, productDescription, productPrice }) => {
  const [imageUrl, setImageUrl] = useState('');
  const [quantity, setQuantity] = useState(1);
  const [cartItems, setCartItems] = useState([]);

  useEffect(() => {
    // Simulate fetching image URL
    const fetchImageUrl = async () => {
      // Replace with your actual image URL fetching logic
      const imageUrl = `https://example.com/images/${productId}.jpg`; 
      setImageUrl(imageUrl);
    };

    fetchImageUrl();
  }, [productId]);

  const handleAddTocart = () => {
    const newCartItems = [...cartItems, { id: productId, name: productName, quantity: quantity }];
    setCartItems(newCartItems);
    alert(`Added ${productName} to cart`);
  };

  return (
    <Container className="mt-4">
      <Row>
        <Col lg={6}>
          <Card>
            <Card.Body>
              <Card.Title>{productName}</CardTitle>
              <img
                src={imageUrl}
                alt={productName}

                className="mb-3 mb-lg-0"
              />
              <Card.Text>
                {productDescription}
              </Card.Text>
              <Button variant="primary" onClick={handleAddTocart} >
                Add to Cart
              </Button>
            </Card.Body>
          </Card>
        </Col>
        <Col lg={6}>
          <Card>
            <Card.Body>
              <Card.Title>Price: ${productPrice}</CardTitle>
              <Card.Text>
                Quantity:
                <input
                  type="number"
                  value={quantity}
                  onChange={(e) => setQuantity(parseInt(e.target.value, 10) || 1)}
                  min="1"
                />
              </Card.Text>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
};

export default ProductPage;