import React, { useState, useEffect } from 'react';
import { useDispatch } from 'react-redux';
import { fetchOrders } from '../../store/actions/orderActions';
import { updateOrderStatus } from '../../store/actions/orderActions';
import { makeStyles } from '@mui/styles';

const useStyles = makeStyles((theme) => ({
  container: {
    margin: theme.spacing(2),
  },
}));


const PickList = () => {
  const [orders, setOrders] = useState([]);
  const classes = useStyles();
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchOrders());
  }, [dispatch]);

  const handlePick = async (orderId) => {
    try {
      const response = await dispatch(
        updateOrderStatus(orderId, 'picked')
      );
      // Handle success or error appropriately
    } catch (error) {
      console.error('Error updating order status:', error);
      // Handle error appropriately - maybe show an error message to the user.
    }
  };

  return (
    <div className={classes.container}>
      <h2>Pick List</h2>
      <table className="table">
        <thead>
          <tr>
            <th>Item ID</th>
            <th>Item Name</th>
            <th>Quantity</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {orders.map((order) => (
            <tr key={order.id}>
              <td>{order.itemId}</td>
              <td>{order.itemName}</td>
              <td>{order.quantity}</td>
              <td>{order.status}</td>
              <td>
                <button onClick={() => handlePick(order.id)} className="btn btn-success">Pick</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default PickList;