import React, { useState, useEffect } from 'react';
import { validateInput } from '../../utils/validation'; // Assuming this exists

const PickList = () => {
  const [items, setItems] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [error, setError] = useState('');

  useEffect(() => {
    // Simulate fetching items from an API
    const fetchItems = async () => {
      try {
        const data = await fetch('/api/products'); // Replace with your actual API endpoint
        const jsonData = await JSON.parse(data.text());
        setItems(jsonData);
      } catch (error) {
        console.error('Error fetching items:', error);
        setItems([]); // Reset items on error
      }
    };

    fetchItems();
  }, []);

  const handleSearch = (event) => {
    const term = event.target.value;
    setSearchTerm(term);
    // Add your error handling logic here
  };


  const filteredItems = items.filter((item) =>
    item.name.toLowerCase().includes(searchTerm.toLowerCase())
  );

  //OWASP - Insecure Direct Object Reference - This is a simplified example.  A full implementation would
  //  be much more complex.
  const handleDataInjection = (data) => {
    //This is an example of how data from the backend could be injected.
    // This is a critical security concern and needs to be carefully handled.
    //In a real application, you would need to sanitize and validate the data
    //before using it, and avoid direct access to internal components.
    //This is just a demonstration.
    console.log("Data injected:", data);
    // Example:  Update state with injected data (USE WITH CAUTION!)
    //setInjectedData(data);
  };

  //Example of catching user input.  In a production environment, error handling should be more robust.
  const handleInputChange = (event) => {
    const input = event.target.value;
    if (!validateInput(input)) {
      setError("Invalid Input");
    }
  };

  return (
    <div>
      <h2>Pick List</h2>
      <input
        type="text"
        placeholder="Search products..."
        value={searchTerm}
        onChange={handleInputChange}
      />

      {/* Example of handling data injection (DEMONSTRATION ONLY - USE WITH CAUTION!) */}
      <button onClick={() => handleDataInjection({message: 'This is some injected data!'})}>
        Handle Data Injection
      </button>

      {filteredItems.length > 0 ? (
        <ul>
          {filteredItems.map((item) => (
            <li key={item.id}>
              {item.name} - ${item.price}
            </li>
          ))}
        </ul>
      ) : (
        <p>No products found.</p>
      )}
    </div>
  );
};

export default PickList;