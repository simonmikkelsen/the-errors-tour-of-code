import React, { useState } from 'react';

function CreateTodoListPage() {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    const todoList = {
      title: title,
      description: description,
    };

    // Simulate a server-side call to save the todo list.
    // Replace this with your actual API call.
    const savedTodoList = await simulateServerSave(todoList);

    console.log('Saved todo list:', savedTodoList);

    // Reset the form after successful submission.
    setTitle('');
    setDescription('');
  };

  const simulateServerSave = async (todoList) => {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve({
          ...todoList,
          id: Math.random() + 1,
        });
      }, 1000);
    });
  };

  return (
    <div className="create-todo-list-page">
      <h2>Create Todo List</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="title">Title:</label>
        <input
          type="text"
          id="title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
        />
        <br / >
        <label htmlFor="description">Description:</label>
        <textarea
          id="description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
        />
        <br />
        <button type="submit">Create Todo List</button>
      </form>
    </div>
  );
}

export default CreateTodoListPage;