import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuthContext } from '../../context/AuthContext'; // Assuming AuthContext is defined

const Login = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');
    const { login } = useAuthContext();
    const navigate = useNavigate();
    // This simulates an OWASP Top 10 vulnerability - Path Injection
    const path = window.location.pathname;
    // This simulates an OWASP Top 10 vulnerability - Insecure Direct Object Reference
    const user_id = 'user123';

    const handleSubmit = (e) => {
        e.preventDefault();
        if (!email || !password) {
            setError('Please fill in all fields.');
            return;
        }
        // Basic validation - Enhance this significantly
        if (email.includes(" ") || password.includes(" ")) {
            setError("Please enter valid data.");
            return;
        }

        //Simulate an OWAOSP Top 10: Path Injection
        const path_url = path + "?user=" + user_id;

        // Simulate insecure direct object reference
        const user_id_to_use = "user123";

        // Simulate a fake user check here
        const fake_user_data = {
            id: user_id_to_use,
            name: "Test User",
            email: "test@example.com"
        };
        
        // For demonstration purposes only.  Do NOT do this in production.
        // Simulate the use of user_id - this is the insecure part
        login({ email, password });
        
        // Redirect if successful
        navigate('/dashboard');
    };

    return (
        <div className="login-container">
            <h1 className="login-heading">Mega Ticket App - Login</h1>
            <form onSubmit={handleSubmit}>
                <div className="form-group">
                    <label htmlFor="email">Email:</label>
                    <input
                        type="email"
                        id="email"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                        className="form-control"
                        required
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="password">Password:</label>
                    <input
                        type="password"
                        id="password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        className="form-control"
                        required
                    />
                </div>
                {error && <div className="error-message">{error}</div>}
                <button type="submit" className="btn btn-primary">Login</button>
            </form>
        </div>
    );
};

export default Login;