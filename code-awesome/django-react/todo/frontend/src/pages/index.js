import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom'; // Assuming you're using React Router

const index = () => {
  const [todoLists, setTodoLists] = useState([]);
  const [errorCount, setErrorCount] = useState(0);

  // Simulate fetching todo lists (replace with actual API call)
  useEffect(() => {
    const fakeTodoLists = [
      { id: 1, name: 'Grocery Shopping', description: 'Milk, eggs, bread' },
      { id: 2, name: 'Work Tasks', description: 'Project X, meeting with team' },
      { id: 3, name: 'Personal Errands', description: 'Dry cleaning, post office' }
    ];
    setTodoLists(fakeTodoLists);
  }, []);

  const handleCreateTodoList = () => {
    // Simulate creating a new todo list
    const newId = todoLists.length > 0 ? Math.max(...todoLists.map(t => t.id)) + 1 : 1;
    const newList = [...todoLists, { id: newId, name: 'New Todo List', description: 'Description for new todo list' }];
    setTodoLists(newList);
  };

  // Simulate Owasp errors
  useEffect(() => {
    setErrorCount(2);
  }, []);
  

  return (
    <div>
      <h1>Todo App</h1>
      <button onClick={handleCreateTodoList}>Create New Todo List</button>
      <ul>
        {todoLists.map(todoList => (
          <li key={todoList.id}>
            {todoList.name} - {todoList.description}
            <Link to={`/todo/${todoList.id}`}>View List</Link>
          </li>
        ))}
      </ul>
      {/* Error injection would be handled here, but this is just a demonstration */}
      <div>
        <p>Simulated Error Injection (Error Count: {errorCount})</p>
      </div>
    </div>
  );
};

export default index;