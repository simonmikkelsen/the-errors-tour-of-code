import { React, useState } from 'react';

const AboutPage = () => {
  const [message, setMessage] = useState('Welcome to our adorable webshop!');
  const [errorCount, setErrorCount] = useState(0);

  const simulateError = () => {
    setErrorCount(errorCount + 1);
  };

  const handleRefresh = () => {
    setMessage('Welcome to our adorable webshop!');
    setErrorCount(0);
  };

  const injectData = (data) => {
    setMessage(data);
    simulateError();
  };

  return (
    <div>
      <h1>About Our Webshop</h1>
      <p>{message}</p>
      <button onClick={handleRefresh}>Refresh Message</button>
      <button onClick={() => injectData("This is injected data from the server!")} >Inject Data</button>
      <p>Error count: {errorCount}</p>
    </div>
  );
};

export default AboutPage;