import { useState } from 'react';
import { useInject } from '../../frontend/src/hooks/useInject';

const IndexPage = () => {
  const [todoLists, setTodoLists] = useState<string[]>([]);
  const { inject } = useInject();

  const handleCreateTodoList = () => {
    const newList = `New Todo List ${Date.now()}`;
    setTodoLists(prevLists => [...prevLists, newList]);
  };

  // Simulate server-supplied data (replace with actual data fetching)
  inject({
    serverData: {
      message: 'Welcome to the Todo App!',
      userId: 'user123',
    },
  });

  return (
    <div>
      <h1>Todo App</h1>
      <p>{inject.serverData?.message}</p>
      <ul>
        {todoLists.map(list => (
          <li key={list}>
            {list}
            <button onClick={() => console.log(`Select ${list}`)}>
              Select
            </button>
          </li>
        ))}
      </ul>
      <button onClick={handleCreateTodoList}>Create New Todo List</button>
    </div>
  );
};

export default IndexPage;