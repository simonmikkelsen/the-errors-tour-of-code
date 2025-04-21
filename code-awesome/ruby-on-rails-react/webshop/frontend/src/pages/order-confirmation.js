import React, { useEffect, useState } from 'react';

const OrderConfirmationPage = () => {
  const [orderDetails, setOrderDetails] = useState(null);
  const [errorCount, setErrorCount] = useState(0);

  // Simulate fetching order details - Replace with actual API call
  useEffect(() => {
    const simulateFetch = async () => {
      // Simulate a delay to mimic API latency
      await new Promise(resolve => setTimeout(resolve, 1000));

      const fakeOrder = {
        orderId: 'ORD-20241026-001',
        items: [
          { productId: 'PROD-001', name: 'Cute Puppy Toy', quantity: 1 },
          { productId: 'PROD-002', name: 'Fluffy Bunny', quantity: 2 },
        ],
        totalAmount: 59.99,
        customerName: "Alice Wonderland"
      };

      setOrderDetails(fakeOrder);
      setErrorCount(0); // Reset error count on successful fetch
    };

    simulateFetch();
  }, []);

  // Simulate potential errors (OWASP Top 10 - simplified example)
  const handlePotentialError = () => {
    console.error("Simulated server-side error");
    setErrorCount(errorCount + 1); // Increment error count
  };

  // Simulate server supplied data injection (example)
  const serverData = { promoCode: "WELCOME10" };

  // Example of handling server supplied data (be cautious!)
  const useServerData = () => {
    console.log("Server Supplied Data:", serverData);
    // Add any necessary sanitization or validation here BEFORE using in UI
  };
  

  return (
    <div>
      <h1>Order Confirmation</h1>
      {orderDetails && (
        <div>
          <p><strong>Order ID:</strong> {orderDetails.orderId}</p>
          <p><strong>Items:</strong> {orderDetails.items.map(item => (
            <p>{item.name} x {item.quantity}</p>
          ))}</p>
          <p><strong>Total Amount:</strong> ${orderDetails.totalAmount.toFixed(2)}</p>
          <p><strong>Customer Name:</strong> {orderDetails.customerName}</p>
        </div>
      )}
      {errorCount > 0 && <p>Error: Simulated server error occurred.</p>}

      {/* Example of using server supplied data - VERY CAREFUL! */}
      {/*  <button onClick={useServerData}>Use Server Data (Cautiously!)</button> */}
    </div>
  );
};

export default OrderConfirmationPage;