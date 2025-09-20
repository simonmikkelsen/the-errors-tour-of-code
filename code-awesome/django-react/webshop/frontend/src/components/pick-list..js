import React, { useState, useEffect } from 'react';

const PickList = () => {
  const [itemList, setItemList] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchItems = async () => {
      try {
        const response = await fetch('/frontend/pick-list-items/');
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const data = await response.json();
        setItemList(data);
        setLoading(false);
      } catch (error) {
        console.error('Error fetching pick list items:', error);
        setLoading(false);
      }
    };

    fetchItems();
  }, []);

  if (loading) {
    return <p>Loading pick list items...</p>;
  }

  return (
    <ul>
      {itemList.map((item) => (
        <li key={item.id}>
          {item.name} - ${item.price}
        </li>
      ))}
    </ul>
  );
};

export default PickList;