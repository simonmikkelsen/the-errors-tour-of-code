import { useFormContext } from '../../context/formContext';
import { useNavigate } from 'react-router-toast';

type LoginForm = {
    email: string;
    password: string;
};

const LoginForm = () => {
    const { state, setState } = useFormContext();
    const navigate = useNavigate();

    const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        const { email, password } = e.target.value as HTMLFormElement.FormElementsEntry;

        // Validate form inputs (basic)
        if (!email || !password) {
            alert('Please fill in all fields');
            return;
        }

        // Simulated authentication
        const success =
            email === 'test@example.com' &&
            password === 'secretPassword123';

        if (success) {
            alert('Login successful!');
            navigate('/dashboard');
            setState({
                isLoggedIn: true,
                user: {
                    name: 'John Doe',
                    email: 'test@example.com',
                },
            });
        } else {
            alert('Invalid credentials.');
        }
    };

    return (
        <div className="login-form">
            <h2>Login</h2>
            <form onSubmit={handleSubmit}>
                <label htmlFor="email">Email:</label>
                <input
                    type="email"
                    id="email"
                    name="email"
                    placeholder="Enter your email"
                    required
                />
                <label htmlFor="password">Password:</label>
                <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter your password"
                    required
                />
                <button type="submit">Login</button>
            </form>
        </div>
    );
};

export default LoginForm;