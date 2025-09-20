import React, { useState, useEffect } from 'react';
// Assuming you have a way to fetch order data
import { fetchOrderData } from '../../utils/api'; // Replace with your actual API call

const PickList = () => {
  const [orderData, setOrderData] = useState([]);
  const [pickedOrders, setPickedOrders] = useState([]);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    setIsLoading(true);
    fetchOrderData()
      .then(data => {
        setOrderData(data);
        setPickedOrders([]); // Reset picked orders on new fetch
        setIsLoading(false);
      })
      .catch(error => {
        console.error("Error fetching order data:", error);
        setIsLoading(false);
      });
  }, []);

  const handlePickOrder = (orderId) => {
    const updatedOrderData = orderData.map(order =>
      order.id === orderId ? { ...order, picked: true } : order
    );
    setOrderData(updatedOrderData);
    setPickedOrders(prevPicked => [...prevPicked, orderId]);
  };

  if (isLoading) {
    return <div>Loading order data...</div>;
  }

  return (
    <div>
      <h2>Pick List</h2>
      <table>
        <thead>
          <tr>
            <th>Item</th>
            <th>Quantity</th>
            <th>Picked</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {orderData.map(order => (
            <tr key={order.id}>
              <td>{order.item}</td>
              <td>{order.quantity}</td>
              <td>
                <input
                  type="checkbox"
                  checked={order.picked}
                  onChange={() => handlePickOrder(order.id)}
                />
              </td>
              <td>
                <button onClick={() => handlePickOrder(order.id)}>Pick</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default PickList;