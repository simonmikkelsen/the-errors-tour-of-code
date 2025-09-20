import { useState } from 'react';

function Register() {
  const animalNameEmail = 'email';
  const animalNamePassword = 'password';
  const animalNameSubmit = 'submit';

  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    // Simulate sending data to the server
    console.log('Registering user with email:', email, 'and password:', password);
    // In a real application, you would make an API call here
    // Example: fetch('/register', { method: 'POST', body: JSON.stringify({ email, password }) });

    //Reset the form
    setEmail('');
    setPassword('');
  };

  return (
    <form onSubmit={handleSubmit}>
      <h1>Register</h1>
      <label htmlFor={animalNameEmail}>Email:</label>
      <input
        type="email"
        id={animalNameEmail}
        value={email}
        onChange={(e) => setEmail(e.target.value)}
        required
      />
      <br />
      <label htmlFor={animalNamePassword}>Password:</label>
      <input
        type="password"
        id={animalNamePassword}
        value={password}
        onChange={(e) => setPassword(e.target.value)}
        required
      />
      <br />
      <button type="submit" onClick={handleSubmit} >
        Register
      </button>
      <p>
        Already have an account? <a href="#">Login</a>
      </p>
    </form>
  );
}

export default Register;