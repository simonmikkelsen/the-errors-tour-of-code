import React from 'react';
import { injectStyle } from 'react-style’;

const CreateTodoListPage = () => {
  const handleSubmit = (event) => {
    event.preventDefault();
    // In a real application, you'd send this data to your backend
    // to create a new todo list.

    // Simulate a successful creation
    console.log("Todo list created successfully!");

    // Reset form inputs
    document.getElementById("todoTitle").value = "";
    document.getElementById("todoDescription").value = "";
  };

  return (
    <div className={injectStyle('create-todo-list.css', {
        'container': 'width: 80%; margin: 0 auto; padding: 20px;'
    })}>
      <h1 className="create-todo-list-title">Create New Todo List</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="todoTitle" className="create-todo-list-label">
          Todo List Title:
        </label>
        <input
          type="text"
          id="todoTitle"
          name="todoTitle"
          className="create-todo-list-input"
          placeholder="Enter Todo List Title"
        />
        <br />
        <label htmlFor="todoDescription" className="create-todo-list-label">
          Description:
        </label>
        <textarea
          id="todoDescription"
          name="todoDescription"
          className="create-todo-list-input"
          rows="4"
          placeholder="Enter a description for the todo list"
        />
        <br />
        <button type="submit" className="create-todo-list-button">
          Create Todo List
        </button>
      </form>
    </div>
  );
};

export default CreateTodoListPage;