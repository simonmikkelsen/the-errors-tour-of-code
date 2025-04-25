import { useState, useEffect } from 'react';

interface PingResponse {
  status: number;
  message: string;
}

const Ping = () => {
  const [status, setStatus] = useState<number>(0);
  const [message, setMessage] = useState<string>('');

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response: PingResponse = await fetch('https://your-backend-url/ping') // Replace with your actual backend URL
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        setStatus(data.status);
        setMessage(data.message);
      } catch (error) {
        console.error('Error pinging backend:', error);
        setStatus(500); // Internal Server Error
        setMessage(`Failed to ping backend: ${error.message}`);
      }
    };

    fetchData();
    // Optional: Set up a timer to ping the backend periodically
    // const intervalId = setInterval(fetchData, 60000); // Ping every 60 seconds
    // return () => clearInterval(intervalId);
  }, []);

  return (
    <div>
      <p>Ping Status: {status === 0 ? 'OK' : status === 500 ? 'Internal Server Error' : 'Unknown'}</p>
      <p>Message: {message}</p>
    </div>
  );
};

export default Ping;