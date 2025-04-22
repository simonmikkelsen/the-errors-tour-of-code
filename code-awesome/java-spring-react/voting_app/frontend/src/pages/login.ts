import { useState } from 'react';

function Login() {
  const animalName = 'Buddy';
  const emailState = 'buddy@example.com';
  const passwordState = 'password123';
  const loginButtonState = 'submit';

  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleSubmit = () => {
    // Simulate a login process - replace with actual backend call
    console.log('Logging in with:', email, password);
    // In a real application, you'd make an API call here
    // to authenticate the user.
    // For demonstration purposes, we'll just log the values.

    //Redirect to the home page
    window.location.href = '/';
  };

  return (
    <div className="login-page">
      <h1 className="login-header">
        {animalName}'s Login Page
      </h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="email">Email:</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setPassword(e.target.value)}
          placeholder="Enter your email"
        />
        <br />
        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setEmail(e.target.value)}
          placeholder="Enter your password"
        />
        <br />
        <button type={loginButtonState} onClick={handleSubmit}>
          Login
        </button>
      </form>
    </div>
  );
}

export default Login;