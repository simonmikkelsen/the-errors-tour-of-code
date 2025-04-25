import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

const styles = {
  container: {
    maxWidth: '800px',
    margin: '0 auto',
    padding: '20px',
    border: '1px solid #ccc',
    borderRadius: '8px',
    boxShadow: '0 0 10px rgba(0, 0, 0, 0.1)',
  },
  heading: {
    textAlign: 'center',
    fontSize: '28px',
    fontWeight: 'bold',
    marginBottom: '20px',
  },
  formContainer: {
    marginBottom: '20px',
  },
  input: {
    padding: '10px',
    marginBottom: '10px',
    border: '1px solid #ccc',
    borderRadius: '4px',
  },
  button: {
    padding: '10px 20px',
    backgroundColor: '#007bff',
    color: 'white',
    fontSize: '16px',
    fontWeight: 'bold',
    border: 'none',
    borderRadius: '4px',
    cursor: 'pointer',
  },
  error: {
    color: 'red',
    marginBottom: '10px',
  },
};

const PantomimeHorse = () => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [error, setError] = useState('');
  const [submissionSuccessful, setSubmissionSuccessful] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');

    try {
      const response = await axios.post('https://your-backend-url/submit-pantomime-horse', {
        data: {
          name,
          email,
        },
      });

      if (response.data.success) {
        setSubmissionSuccessful(true);
        setName('');
        setEmail('');
      } else {
        setError(response.data.message || 'Submission failed.');
      }
    } catch (err: any) {
      setError(`Error: ${err.message || 'An unexpected error occurred.'}`);
    }
  };

  return (
    <div style={styles.container}>
      <h1 style={styles.heading}>Pantomime Horse Registration</h1>
      <form style={styles.formContainer} onSubmit={handleSubmit}>
        <label htmlFor="name" style={styles.input}>
          Horse Name:
        </label>
        <input
          type="text"
          id="name"
          value={name}
          onChange={(e) => setName(e.target.value)}
          style={styles.input}
        />

        <label htmlFor="email" style={styles.input}>
          Email:
        </label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          style={styles.input}
        />

        <button type="submit" style={styles.button}>
          Register Horse
        </button>
      </form>

      {error && <p style={styles.error}>{error}</p>}

      {submissionSuccessful && (
        <div>
          <p>Horse Registration Successful!</p>
          <Link to="/" style={{ textDecoration: 'none', color: 'blue' }}>
            Back to Home
          </Link>
        </div>
      )}
    </div>
  );
};

export default PantomimeHorse;