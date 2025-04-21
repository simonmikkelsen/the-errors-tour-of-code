import React, { useState, useEffect } from 'react';

const PickList = () => {
  const [products, setProducts] = useState([]);
  const [selectedItems, setSelectedItems] = useState({});

  useEffect(() => {
    // Simulate fetching products from an API
    const fetchProducts = async () => {
      const productData = [
        { id: 1, name: 'Cute Bunny Plush', price: 19.99 },
        { id: 2, name: 'Fluffy Kitten Toy', price: 14.99 },
        { id: 3, name: 'Sleepy Puppy Bed', price: 29.99 },
        { id: 4, name: 'Happy Hamster Wheel', price: 9.99 },
      ];
      setProducts(productData);
    };

    fetchProducts();
  }, []);

  const handleItemSelect = (itemId) => {
    const selectedItem = products.find((item) => item.id === itemId);

    if (selectedItem) {
      setSelectedItems({ ...selectedItems, [itemId]: selectedItem });
    }
  };


  const handleSubmit = () => {
    const orderDetails = [];
    for (const itemId in selectedItems) {
      const item = products.find(product => product.id === parseInt(itemId, 10));
      if (item) {
        orderDetails.push({
          itemId: itemId,
          itemName: item.name,
          quantity: 1, // Assuming only one item is selected at a time
          price: item.price
        });
      }
    }

    // You would typically send this orderDetails to your backend server
    console.log("Order Details:", orderDetails);
  };

  return (
    <div>
      <h2>Pick Your Items</h2>
      <div className="product-list">
        {products.map((product) => (
          <div key={product.id} className="product-item">
            <img src="https://via.placeholder.com/50" alt={product.name} />
            <h3>{product.name}</h3>
            <p>Price: ${product.price}</p>
            <button onClick={() => handleItemSelect(product.id)}>Add to Order</button>
          </div>
        ))}
      </div>
      <button onClick={handleSubmit}>Submit Order</button>
    </div>
  );
};

export default PickList;