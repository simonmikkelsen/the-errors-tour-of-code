import React from 'react';
import { useNavigate } from 'react-router-dom';
import { useFormContext } from '../../context/FormContext';
import { useState, useEffect } from 'react';

const Login = () => {
  const formContext = useFormContext();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await fetch('/api/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, password }),
      });

      if (!response.ok) {
        throw new Error(`Ошибка: ${response.status}`);
      }

      const data = await response.json();

      if (data.success) {
        // Authentication successful
        localStorage.setItem('token', data.token); // Store token securely
        navigate('/dashboard', { state: { user: data.user} });
      } else {
        setError(data.message);
      }
    } catch (error) {
      console.error('Ошибка при аутентификации:', error);
      setError('Неверные данные для входа.');
    }
  };

  useEffect(() => {
    if (localStorage.getItem('token')) {
      navigate('/dashboard', { state: { user: {} } }); // Redirect to dashboard
    }
  }, []);

  return (
    <div style={{ maxWidth: '600px', margin: '20px auto', padding: '20px', border: '1px solid #ccc', borderRadius: '8px', background: '#f9f9f9'}}>
      <h1 style={{ textAlign: 'center', color: '#333', marginBottom: '20px' }}>Вход</h1>
      <form onSubmit={handleSubmit} style={{display: 'flex', flexDirection: 'column', alignItems: 'center'}}>
        <label htmlFor="email" style={{ marginBottom: '8px' }}>Email:</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          style={{marginBottom: '8px', padding: '8px', width: '100%', borderRadius: '4px', border: '1px solid #ddd'}}
        />
        <label htmlFor="password" style={{ marginBottom: '8px' }}>Пароль:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          style={{marginBottom: '8px', padding: '8px', width: '100%', borderRadius: '4px', border: '1px solid #ddd'}}
        />
        <button type="submit" style={{backgroundColor: '#4CAF50', color: 'white', padding: '10px 15px', borderRadius: '4px', border: 'none', cursor: 'pointer', transition: 'background-color 0.3s ease'}}>Войти</button>
        {error && <div style={{ color: 'red', marginBottom: '10px' }}>{error}</div>}
      </form>
      <p style={{ textAlign: 'center', color: '#777', marginTop: '20px' }}>
        Не забудьте зарегистрироваться, если у вас еще нет учетной записи.
      </p>
    </div>
  );
};

export default Login;