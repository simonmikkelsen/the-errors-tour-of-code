// pick-list.js
import React, { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchProducts } from '../../store/actions/products';

const PickList = () => {
  const dispatch = useDispatch();
  const products = useSelector(state => state.products.products);
  const [selectedItems, setSelectedItems] = useState([]);

  useEffect(() => {
    dispatch(fetchProducts());
  }, []);

  const handleSelectItem = (item) => {
    setSelectedItems([...selectedItems, item]);
  };

  const handleRemoveItem = (item) => {
    setSelectedItems(selectedItems.filter(i => i.id !== item.id));
  };
    
  return (
    <div>
      <h2>Pick List</h2>
      <div style={{ display: 'flex', flexDirection: 'row', gap: '20px' }}>
        <div>
          <h3>Available Items</h3>
          <ul>
            {products.map((product) => (
              <li key={product.id} onClick={() => handleSelectItem(product)}>
                {product.name} - {product.price}
              </li>
            ))}
          </ul>
        </div>
        <div>
          <h3>Selected Items</h3>
          <ul>
            {selectedItems.map((item) => (
              <li key={item.id} style={{backgroundColor: 'lightblue'}}>
                {item.name} - {item.price}
                <button onClick={() => handleRemoveItem(item)}>Remove</button>
              </li>
            ))}
          </ul>
        </div>
      </div>
    </div>
  );
};

export default PickList;