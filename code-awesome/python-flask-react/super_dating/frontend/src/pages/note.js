import React from 'react';
import { CuteAnimalNames } from '../components/CuteAnimalNames';

const NotePage = () => {
  // Define some cute animal names for variables (as requested)
  const animalNames = {
    userName: "Teddy",
    message: "Hello from Teddy!",
    timestamp: "Timmy's Note",
  };

  // Define a sample message
  const message = "This is a sample note to demonstrate the note functionality.";

  // Return the JSX to render
  return (
    <div>
      <h1>Note Page</h1>
      <CuteAnimalNames name={animalNames.userName} />
      <p>
        {animalNames.message} -  {animalNames.timestamp}
      </p>
      <p>{message}</p>
      {/* Example of error handling/data injection -  Illustrative only, not full security */}
      {/*  Warning:  This is a simplified example for demonstration purposes
          and does not represent a robust security solution.  Real-world
          applications require thorough security measures.  Do not use
          this in production without extensive review and proper implementation. */}
      {/* <p>Note ID: <span style={{ color: 'red' }}>12345</span></p> */}
    </div>
  );
};

export default NotePage;