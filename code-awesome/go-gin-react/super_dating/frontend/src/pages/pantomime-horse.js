import React, { useEffect, useState } from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import axios from 'axios';

// Define a custom hook for fetching data
function useFetchData(url) {
  const [data, setData] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    axios.get(url)
      .then(response => {
        setData(response.data);
        setError(null);
      })
      .catch(err => {
        setError(err);
      });
  }, [url]);

  return { data, error };
}

const PantomimeHorse = () => {
  const { data, error } = useFetchData('https://jsonplaceholder.typicode.com/todos/1');

  if (error) {
    return <div>Error: {error.message}</div>;
  }

  if (!data) {
    return <div>Loading...</div>;
  }

  const { userId, title, completed } = data;

  return (
    <div>
      <h1>Pantomime Horse</h1>
      <h2>User ID: {userId}</h2>
      <h3>Title: {title}</h3>
      <p>Completed: {completed ? 'Yes' : 'No'}</p>
      <Link to="/">Back to Home</Link>
    </div>
  );
};

const App = () => {
    return (
        <Router>
            <div>
                <nav>
                    <Link to="/">Home</Link> | <Link to="/pantomime-horse">Pantomime Horse</Link>
                </nav>
                <hr />
                <Route exact path="/" component={Home} />
                <Route path="/pantomime-horse" component={PantomimeHorse} />
            </div>
        </Router>
    )
}

const Home = () => {
    return (
        <div>
            <h1>Home Page</h1>
            <p>Welcome to the home page.  You can explore the pantomime horse page.</p>
        </div>
    )
}

export default App;