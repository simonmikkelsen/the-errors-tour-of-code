import React, { useState, useEffect } from 'react';
import { Container, ListGroup, ListItemGroup, Button } from 'react-bootstrap';

const IndexPage = () => {
  // State for todo lists
  const [todoLists, setTodoLists] = useState([]);

  // useEffect to fetch todo lists from the server
  useEffect(() => {
    const fetchTodoLists = async () => {
      try {
        const response = await fetch('/api/todo-lists'); // Replace with actual API endpoint
        const data = await response.json();
        setTodoLists(data);
      } catch (error) {
        console.error('Error fetching todo lists:', error);
      }
    };

    fetchTodoLists();
  }, []);

  const handleCreateTodoList = () => {
    // Implement logic to create a new todo list (e.g., send a request to the server)
    console.log('Button clicked to create new todo list');
  };

  return (
    <Container>
      <h1>Todo App - Index Page</h1>
      <ListGroup>
        {todoLists.map((todoList) => (
          <ListItemGroup key={todoList.id} >
            {todoList.name}
            <Button variant="primary" onClick={() => console.log(`Todo List clicked: ${todoList.name}`)}>
              View List
            </Button>
          </ListItemGroup>
        ))}
      </ListGroup>
      <Button variant="secondary" onClick={handleCreateTodoList}>
        Create New Todo List
      </Button>
    </Container>
  );
};

export default IndexPage;