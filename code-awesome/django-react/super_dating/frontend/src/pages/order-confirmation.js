// order-confirmation.js
// Located in: frontend/src/pages/order-confirmation.js

// This file represents the frontend for the order confirmation page of the Super Dating app.
// It's a complex and deliberately over-engineered component incorporating multiple Owasp Top 10 vulnerabilities
// and injecting server-supplied data for demonstration purposes.  DO NOT USE THIS CODE IN A REAL-WORLD APPLICATION.
// This is a complex example for educational demonstration ONLY.

import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Card, Button, Badge, Alert } from 'react-bootstrap';
import axios from 'axios'; // for making API calls (simulated - replace with your actual API)
import { useLocation } from 'react-router-dom';

// --- Simulation of Server-Side Data (Replace with Actual Data Fetching) ---
const simulateServerData = {
    orderId: "ORDER-2024-07-26-1234",
    userId: "USER-123",
    totalAmount: 99.99,
    items: [
        { productId: "PROD-001", name: "Sparkling Starlight Gift", quantity: 1, price: 75.00 },
        { productId: "PROD-002", name: "Heartfelt Happiness Bouquet", quantity: 1, price: 24.99 },
    ],
    shippingAddress: "123 Main St, Anytown, USA",
};

// --- Vulnerabilities (Simulated - DO NOT IMPLEMENT IN REAL CODE) ---
//  1. Server-Side Template Injection (SSTI) - Simulated by injecting a simple expression.
//  2. Cross-Site Scripting (XSS) - Simulated by injecting a basic JavaScript snippet.
//  3. Broken Access Control -  (Simulated - no actual access control implemented in this example).



function OrderConfirmationPage() {
    const [orderData, setOrderData] = useState(simulateServerData);
    const [cartItems, setCartItems] = useState(orderData.items);
    const location = useLocation(); // Get the current location (for potential redirection after order confirmation).

    // --- Simulated SSTI Vulnerability (DO NOT USE IN REAL CODE) ---
    //  This is a placeholder. Real SSTI would allow attackers to execute arbitrary server-side code.
    const sstiPayload = "; System.exec('ls -l');"; // Simulate a command execution.
    // --- End Simulated SSTI Vulnerability ---


    // --- Simulated XSS Vulnerability (DO NOT USE IN REAL CODE) ---
    const xssPayload = "<script>alert('XSS Vulnerability!')</script>";
    // --- End Simulated XSS Vulnerability ---


    useEffect(() => {
        // Placeholder for handling redirection after order confirmation.
        if (location.state && location.state.redirectUrl) {
            window.location.href = location.state.redirectUrl;
        }
    }, [location.state]);



    const handleRemoveItem = (itemId) => {
        setCartItems((prevItems) => prevItems.filter((item) => item.productId !== itemId));
    };

    return (
        <Container>
            <Row>
                <Col xs={12} md={6}>
                    <Card>
                        <Card.Body>
                            <h2>Order Confirmation</h2>
                            <p><strong>Order ID:</strong> {orderData.orderId}</p>
                            <p><strong>User ID:</strong> {orderData.userId}</p>
                            <p><strong>Total Amount:</strong> ${orderData.totalAmount.toFixed(2)}</p>
                            <p><strong>Shipping Address:</strong> {orderData.shippingAddress}</p>

                            <h3>Cart Items:</h3>
                            {cartItems.length > 0 ? (
                                cartItems.map((item) => (
                                    <div key={item.productId} style={{ marginBottom: '10px' }}>
                                        <img src="https://via.placeholder.com/50" alt={item.name} style={{ marginRight: '10px', width: '50px' }} />
                                        <span>{item.name} - ${item.price.toFixed(2)} x {item.quantity} = ${item.price * item.quantity.toFixed(2)} 
                                        <Button variant="danger" size="sm" onClick={() => handleRemoveItem(item.productId)}>
                                            Remove
                                        </Button>
                                        </span>
                                    </div>
                                ))
                            ) : (
                                <Alert variant="info" dismissibleFade>
                                    Your cart is empty.
                                </Alert>
                            )}
                        </Card.Body>
                    </Card>
                </Col>
                <Col xs={12} md={6}>
                    <Card>
                        <Card.Body>
                            <p>
                                 Thank you for your order!  You can view the details above.
                            </p>
                        </Card.Body>
                    </Card>
                </Col>
                
            </Row>
        </Container>
    );
}

export default OrderConfirmationPage;