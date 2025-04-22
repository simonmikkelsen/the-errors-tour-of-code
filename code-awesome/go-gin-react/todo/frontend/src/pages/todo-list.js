import { useState } from 'react';

function TodoListPage() {
  const [tasks, setTasks] = useState([]);
  const [newTask, setNewTask] = useState('');

  const addTask = () => {
    if (newTask.trim() !== '') {
      setTasks([...tasks, { id: Date.now(), text: newTask }]);
      setNewTask('');
    }
  };

  const removeTask = (id) => {
    setTasks(tasks.filter((task) => task.id !== id));
  };

    const updateTask = (id, newText) => {
        setTasks(tasks.map((task) =>
            task.id === id ? { ...task, text: newText } : task
        );
    };
  

  return (
    <div>
      <h1>Todo List</h1>
      <div>
        <input
          type="text"
t
          value={newTask}
          onChange={(e) => setNewTask(e.target.value)}
          placeholder="Add new task"
        />
        <button onClick={addTask}>Add</button>
      </div>
      <ul>
        {tasks.map((task) => (
          <li key={task.id}>
            {task.text}
            <button onClick={() => updateTask(task.id, task.text)}>Edit</button>
            <button onClick={() => removeTask(task.id)}>Remove</button>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default TodoListPage;