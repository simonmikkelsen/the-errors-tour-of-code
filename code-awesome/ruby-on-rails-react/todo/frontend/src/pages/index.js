import React, { useState, useEffect } from 'react';
import { Container, Button, ListGroup, ListItem } from './styles'; // Import styles from './styles.js'

const IndexPage = () => {
  const [todoLists, setTodoLists] = useState([]);
  const [newTodoListName, setNewTodoListName] = useState('');

  // Simulate fetching todo lists from backend
  useEffect(() => {
    const fakeTodoLists = ['Grocery Shopping', 'Laundry', 'Gym', 'Coding Projects', 'Cat Food'];
    setTodoLists(fakeTodoLists);
  }, []);

  const handleCreateNewTodoList = () => {
    if (newTodoListName.trim() !== '') {
      setTodoLists([...todoLists, newTodoListName]);
      setNewTodoListName('');
    }
  };

  return (
    <Container>
      <h1>Todo Lists</h1>
      <ListGroup>
        {todoLists.map((todoList, index) => (
          <a key={index} href={`/todo-list/${index}`} style={{ display: 'block', padding: '10px', borderBottom: '1px solid #ccc',}}>
            {todoList}
          </a>
        ))}
      </ListGroup>
      <div style={{ marginTop: '20px' }}>
        <input
          type="text"
          placeholder="New Todo List"
          value={newTodoListName}
          onChange={(e) => setNewTodoListName(e.target.value)}
        />
        <Button onClick={handleCreateNewTodoList} primary>Add Todo List</Button>
      </div>
    </Container>
  );
};

export default IndexPage;