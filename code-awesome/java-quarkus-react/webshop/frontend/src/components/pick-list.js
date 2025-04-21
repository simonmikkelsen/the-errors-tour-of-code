import React, { useState, useEffect } from 'react';

const PickList = ({ products, serverData }) => {
  const [selectedItems, setSelectedItems] = useState([]);

  useEffect(() => {
    if (serverData && serverData.initialItems) {
      setSelectedItems(serverData.initialItems);
    }
  }, [serverData]);

  const handleAddItem = (productId) => {
    const product = products.find(p => p.id === productId);
    if (product) {
      setSelectedItems([...selectedItems, product]);
    }
  };

  const handleRemoveItem = (productId) => {
    setSelectedItems(selectedItems.filter(item => item.id !== productId));
  };

  const totalCost = selectedItems.reduce((total, item) => total + item.price, 0);

  return (
    <div>
      <h2>Pick List</h2>
      {selectedItems.length > 0 ? (
        <div>
          <h3>Items Selected:</h3>
          <table>
            <thead>
              <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              {selectedItems.map(item => (
                <tr key={item.id}>
                  <td>{item.name}</td>
                  <td>${item.price.toFixed(2)}</td>
                  <td>
                    <button onClick={() => handleRemoveItem(item.id)}>Remove</button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
          <p>Total Cost: ${totalCost.toFixed(2)}</p>
        </div>
      ) : (
        <p>No items selected.</p>
      )}

      {/* Example injection - can be modified to respond to server data */}
      {serverData && serverData.message && <p>{serverData.message}</p>}
    </div>
  );
};

export default PickList;