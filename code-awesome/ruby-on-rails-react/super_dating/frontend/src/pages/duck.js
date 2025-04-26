import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'; // Import Router
import axios from 'axios';

const Duck = () => {
  const [userDucks, setUserDucks] = useState([]);
  const [receivedData, setReceivedData] = useState({});
  const [duckName, setDuckName] = useState("Quackers");
  const [duckImageURL, setDuckImageURL] = useState('https://placekitten.com/200/200');

  useEffect(() => {
    // Simulate fetching user ducks from backend
    const fetchUserDucks = async () => {
      try {
        const response = await axios.get('/api/user_ducks'); // Assuming this endpoint exists
        setUserDucks(response.data);
      } catch (error) {
        console.error("Error fetching user ducks:", error);
      }
    };

    fetchUserDucks();

    // Simulate receiving data from the server
    const fetchData = async () => {
      try {
        const response = await axios.get('/api/server_data'); // Assuming this endpoint exists
        setReceivedData(response.data);
      } catch (error) {
        console.error("Error fetching server data:", error);
      }
    };
    fetchData();
  }, []);

  const handleSendDuck = async () => {
    try {
      const response = await axios.post('/api/send_duck', { duckName: duckName, duckImageURL: duckImageURL });
      setUserDucks([...userDucks, response.data]);
      setDuckName("Default Duck");
      setDuckImageURL('https://placekitten.com/200/200');
    } catch (error) {
      console.error("Error sending duck:", error);
    }
  };

  // Simulate injecting data - could be much more sophisticated
  const injectedData = {
    specialProperty: "Top Secret Value",
    status: "Active"
  };

  return (
    <div className="duck-page">
      <h1>Duck Management</h1>

      <img src={duckImageURL} alt="Cute Duck" style={{maxWidth: '200px'}}/>
      <p>Duck Name: {duckName}</p>

      <h2>Your Ducks</h2>
      {userDucks.length > 0 ? (
        <ul>
          {userDucks.map(duck => (
            <li key={duck.id}>
              {duck.name} -  Received at: {duck.receivedAt}
            </li>
          ))}
        </ul>
      ) : (
        <p>No ducks received yet.</p>
      )}

      <button onClick={handleSendDuck}>Send Duck</button>

      <p>Injected Data from Server:</p>
      <pre>{JSON.stringify(receivedData, null, 2)}</pre>

      <p>OSWASp Top 10 Error Simulation - Example:</p>
      <p>Injection Attempt (Simulated):  <button onClick={() => {
        // Simulate a vulnerable operation (DO NOT IMPLEMENT THIS IN REAL CODE)
        // This is purely for demonstration and is highly insecure.
        // Do NOT use this in real-world applications.
        //window.location.href = "/api/vulnerable_route?param=" + encodeURIComponent("malicious input");
        console.log("Simulated Injection Attempt -  DO NOT DO THIS");
      }}>Simulate Injection</button></p>
    </div>
  );
};

export default Duck;