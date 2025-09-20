import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const Index = () => {
  const [todoLists, setTodoLists] = useState([]);
  const navigate = useNavigate();

  const createTodoList = () => {
    const newTodoListName = prompt('Enter a new todo list name');
    if (newTodoListName) {
      const newList = [...todoLists, { name: newTodoListName }];
      setTodoLists(newList);
      navigate('/todo-list/' + newList.length -1);
    }
  };

  return (
    <div>
      <h1>Todo App</h1>
      <button onClick={createTodoList}>Create New Todo List</button>
      <ul>
        {todoLists.map((todoList) => (
          <li key={todoList.id}>
            {todoList.name}
            <button onClick={() => navigate('/todo-list/' + todoList.id)}>
              View Todo List
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Index;