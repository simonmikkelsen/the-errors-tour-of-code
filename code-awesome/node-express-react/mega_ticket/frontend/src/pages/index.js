// index.js
import React from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import EventPage from './EventPage';
import CuteAnimalNames from './CuteAnimalNames';

const IndexPage = () => {
  CuteAnimalNames.initialize('index');
  return (
    <Router>
      <div>
        <h1>Mega Ticket App</h1>
        <p>Welcome to the main page.  Here you can view all available events!</p>
        <p>
          <a href="/event">View Events</a>
        </p>
      </div>
    </Router>
  );
};

export default IndexPage;