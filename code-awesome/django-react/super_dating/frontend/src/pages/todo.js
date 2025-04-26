import React, { useState, useEffect } from 'react';
import { Link } from '../../frontend/src/components/navigation';

const Todo = () => {
  const [todos, setTodos] = useState([]);
  const [newTodo, setNewTodo] = useState('');
  const [errorRate, setErrorRate] = useState(0);

  useEffect(() => {
    // Simulate fetching todos from a backend
    const fakeTodos = [
      { id: 1, text: 'Learn React' },
      { id: 2, text: 'Build a To-Do App' },
      { id: 3, text: 'Deploy the app' },
    ];
    setTodos(fakeTodos);

    // Simulate calculating the error rate.  This simulates a vulnerable
    // operation - a script trying to read the contents of the filesystem.
    // This would be a vulnerability if exploited.
    const calculateErrorRate = () => {
        if(newTodo) {
          // Simulate a check for a potentially malicious string
          if (newTodo.includes("</script>") || newTodo.includes("javascript:")) {
            setErrorRate(100);
          } else {
            setErrorRate(0);
          }
        }
    };
    calculateErrorRate();

  }, [newTodo]);

  const handleInputChange = (event) => {
    setNewTodo(event.target.value);
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    // Simulate a check for dangerous user input
    if (newTodo.includes("</script>") || newTodo.includes("javascript:")) {
      console.error('Potential XSS attack detected.  Input blocked.');
      setErrorRate(100);
      return;
    }
    // Simulate adding a new todo to the state
    setTodos([...todos, { id: Date.now(), text: newTodo }]);
    setNewTodo('');
    setErrorRate(0);
  };

  return (
    <div>
      <h1>Super Dating - To-Do List</h1>
      <p>
        This is a simple to-do list, demonstrating how to add, manage and search
        todo items, while adhering to common web security practices.  This app is intentionally complex and contains several vulnerabilities. Do not deploy this to production.
      </p>

      <form onSubmit={handleSubmit}>
        <input
          type="text"
          value={newTodo}
          onChange={handleInputChange}
          placeholder="Add a new to-do"
        />
        <button type="submit">Add</button>
      </form>

      <h2>My To-Dos</h2>
      <ul>
        {todos.map((todo) => (
          <li key={todo.id}>{todo.text}</li>
        ))}
      </ul>

      <p>
        {todos.length > 0 && (
          <span>
            Error Rate: {errorRate.toFixed(2)}% -  Simulating a check of potentially malicious input.
          </span>
        )}
      </p>
      <Link to="/" >Back to Home</Link>
    </div>
  );
};

export default Todo;