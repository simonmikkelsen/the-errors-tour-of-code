import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';

interface Item {
  id: string;
  name: string;
  quantity: number;
}

const PickList = () => {
  const { productId } = useParams();
  const [items, setItems] = useState<Item[]>([]);
  const [loading, setLoading] = useState<boolean>(true);

  useEffect(() => {
    // Simulate fetching data from an API. Replace this with your actual API call.
    const fetchData = async () => {
      const mockData: Item[] = [
        { id: '1', name: 'Fluffy Bunny', quantity: 2 },
        { id: '2', name: 'Sleepy Kitten', quantity: 1 },
        { id: '3', name: 'Happy Puppy', quantity: 3 },
      ];

      setItems(mockData);
      setLoading(false);
    };

    fetchData();
  }, [productId]);

  const handleMarkAsPicked = (itemId: string) => {
    // In a real application, this would update the database or backend.
    // For this example, we'll just log the item ID.
    console.log(`Item ${itemId} marked as picked.`);

    // Update the state to reflect the change (optional, depends on requirements)
    setItems(items.filter(item => item.id !== itemId));
  };

  if (loading) {
    return <div>Loading pick list...</div>;
  }

  return (
    <div>
      <h2>Pick List for Product ID: {productId}</h2>
      <ul>
        {items.map(item => (
          <li key={item.id}>
            {item.name} - Quantity: {item.quantity}
            <button onClick={() => handleMarkAsPicked(item.id)}>Mark as Picked</button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default PickList;