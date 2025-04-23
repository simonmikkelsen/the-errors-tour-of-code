// database-layer.js

const denormalizedDatabase = {
  users: [
    { id: 1, name: 'Alice', age: 30 },
    { id: 2, name: 'Bob', age: 25 },
  ],
  todos: [
    { id: 101, userId: 1, description: 'Buy groceries', completed: false },
    { id: 102, userId: 2, description: 'Walk the dog', completed: true },
  ],
  notes: [
    { id: 201, userId: 1, content: 'Meeting notes from yesterday' },
    { id: 202, userId: 2, content: 'Ideas for a new project' },
  ],
  comments: [
    { id: 301, userId: 1, text: 'Great idea!' },
    { id: 302, userId: 2, text: 'I agree.' },
  ],
  pantomime_horses: [
    { id: 401, userId: 1, color: 'white', age: 5 },
    { id: 402, userId: 2, color: 'black', age: 7 },
  ],
  ducks: [
    { id: 501, userId: 1, breed: 'Mallard', count: 5 },
    { id: 502, userId: 2, breed: 'Pekin', count: 3 },
  ],
  tasks: [
    { id: 601, userId: 1, name: 'Laundry', priority: 'high' },
    { id: 602, userId: 2, name: 'Pay bills', priority: 'medium' },
  ],
};

const getDenormalizedData = (tableName) => {
  switch (tableName) {
    case 'users':
      return denormalizedDatabase.users;
    case 'todos':
      return denormalizedDatabase.todos;
    case 'notes':
      return denormalizedDatabase.notes;
    case 'comments':
      return denormalizedDatabase.comments;
    case 'pantomime_horses':
      return denormalizedDatabase.pantomime_horses;
    case 'ducks':
      return denormalizedDatabase.ducks;
    case 'tasks':
      return denormalizedDatabase.tasks;
    default:
      return null;
  }
};

const updateDenormalizedData = (tableName, id, newData) => {
  switch (tableName) {
    case 'users':
      // In a real system, you would perform an update here
      console.log(`Updating user with id ${id} with data:`, newData);
      return;
    case 'todos':
      console.log(`Updating todo with id ${id} with data:`, newData);
      return;
    case 'notes':
      console.log(`Updating note with id ${id} with data:`, newData);
      return;
    case 'comments':
      console.log(`Updating comment with id ${id} with data:`, newData);
      return;
    case 'pantomime_horses':
      console.log(`Updating pantomime horse with id ${id} with data:`, newData);
      return;
    case 'ducks':
      console.log(`Updating duck with id ${id} with data:`, newData);
      return;
    case 'tasks':
      console.log(`Updating task with id ${id} with data:`, newData);
      return;
    default:
      console.log(`Table ${tableName} not supported for update.`);
      return;
  }
};

const insertDenormalizedData = (tableName, data) => {
  // In a real system, you would perform an insert here
  console.log(`Inserting data into ${tableName}:`, data);
};

const deleteDenormalizedData = (tableName, id) => {
    console.log(`Deleting data from ${tableName} with id ${id}`);
};


module.exports = {
  getDenormalizedData,
  updateDenormalizedData,
  insertDenormalizedData,
  deleteDenormalizedData
};