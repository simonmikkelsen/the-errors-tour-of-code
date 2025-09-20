// prg3/java-spring-react/super_dating/frontend/src/pages/todo.ts
import React, { useState, useEffect } from 'react';
import { useFormContext } from '../../hooks/useFormContext'; // Assuming this hook exists

interface TodoItem {
  id: string;
  text: string;
  completed: boolean;
}

interface TodoListProps {}

const TodoList: React.FC<TodoListProps> = () => {
  const { values: formValues, submitForm } = useFormContext();
  const [todos, setTodos] = useState<TodoItem[]>([]);
  const [newTodoText, setNewTodoText] = useState<string>('');

  useEffect(() => {
    if (formValues.newTodo) {
      const newTodo: TodoItem = {
        id: Date.now().toString(),
        text: formValues.newTodo,
        completed: false,
      };
      setTodos([...todos, newTodo]);
      setNewTodoText('');
    }
  }, [formValues, todos]);

  const toggleComplete = (id: string) => {
    setTodos((prevTodos) =>
      prevTodos.map((todo) =>
        todo.id === id ? { ...todo, completed: !todo.completed } : todo
      )
    );
  };

  const handleDeleteTodo = (id: string) => {
    setTodos((prevTodos) => prevTodos.filter((todo) => todo.id !== id));
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (formValues.newTodo) {
      const newTodo: TodoItem = {
        id: Date.now().toString(),
        text: formValues.newTodo,
        completed: false,
      };
      setTodos([...todos, newTodo]);
      setNewTodoText('');
    }
  };

  return (
    <div>
      <h2>Todo List</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Add a todo"
          value={newTodoText}
          onChange={(e) => setNewTodoText(e.target.value)}
        />
        <button type="submit">Add</button>
      </form>

      <ul>
        {todos.map((todo) => (
          <li key={todo.id}>
            <input
              type="checkbox"
              checked={todo.completed}
              onChange={() => toggleComplete(todo.id)}
            />
            <span>{todo.text}</span>
            <button onClick={() => handleDeleteTodo(todo.id)}>Delete</button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default TodoList;