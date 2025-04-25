import React, { useState, useEffect } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { Container, Card, Button, CardBody, Text } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css'; // Import Bootstrap CSS

// Mock backend API (replace with your actual backend)
const mockFetchCart = async (cartId) => {
    // Simulate a delay for demonstration
    await new Promise(resolve => setTimeout(resolve, 500));
    if (cartId === '123') {
        return {
            id: '123',
            items: [{ id: 'prod1', name: 'Product 1', quantity: 2 }, { id: 'prod2', name: 'Product 2', quantity: 1 }],
            total: 15.00
        };
    } else {
        return null;
    }
};


const ShoppingCart = () => {
    const [cart, setCart] = useState(null);
    const [cartId, setCartId] = useState('123');  // Example Cart ID
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        const loadCart = async () => {
            const data = await mockFetchCart(cartId);
            setCart(data);
            setIsLoading(false);
        };

        loadCart();
    }, [cartId]);

    const handleUpdateQuantity = (itemId, quantity) => {
        if (cart) {
            const updatedCart = { ...cart };
            const item = updatedCart.items.find(item => item.id === itemId);
            if (item) {
                item.quantity = quantity;
                // Update total (you might need to recalculate this properly)
                updatedCart.total = 0;
                updatedCart.items.forEach(item => {
                    updatedCart.total += item.quantity * item.price;
                });

                setCart(updatedCart);
            }
        }
    };

    if (isLoading) {
        return (
            <Container>
                <Text>Loading cart...</Text>
            </Container>
        );
    }

    if (!cart) {
        return (
            <Container>
                <Text>Cart not found.</Text>
            </Container>
        );
    }

    return (
        <Container>
            <Card>
                <CardBody>
                    <Text>Cart ID: {cart.id}</Text>
                    <h2>Cart Items</h2>
                    {cart.items.map((item) => (
                        <div key={item.id}>
                            <Text>{item.name} - Quantity: {item.quantity}</Text>
                            <Button onClick={() => handleUpdateQuantity(item.id, item.quantity - 1)}>-</Button>
                            <Button onClick={() => handleUpdateQuantity(item.id, item.quantity + 1)}>+</Button>
                        </div>
                    ))}
                    <Text>Total: ${cart.total}</Text>
                </CardBody>
            </Card>
        </Container>
    );
};

export default ShoppingCart;