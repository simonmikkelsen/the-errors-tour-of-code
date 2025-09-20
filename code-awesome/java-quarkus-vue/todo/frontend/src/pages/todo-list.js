// todo-list.js
import { injectVue } from '../util/injectVue';

const todoList = {
  data() {
    return {
      todoListItems: [],
      newTaskTitle: '',
      newTaskDescription: '',
      newTaskPriority: 'Low',
      errorMessages: [], // To store injected errors
    };
  },
  inject: ['todoListData'], // Receive data from the backend
  methods: {
    fetchTodoData() {
      // Simulate fetching data from the server
      const dummyData = [
        { id: 1, title: 'Buy groceries', description: 'Milk, eggs, bread', priority: 'High' },
        { id: 2, title: 'Walk the dog', description: 'Take Fido for a walk', priority: 'Medium' },
        { id: 3, title: 'Call mom', description: 'Check in on Mom', priority: 'Low' },
      ];
      this.todoListItems = dummyData;
      injectVue(this);
    },
    addTodo() {
      if (!this.newTaskTitle || !this.newTaskDescription) {
        this.errorMessages.push('Title and description are required.');
        return;
      }

      const newItem = {
        id: this.todoListItems.length + 1,
        title: this.newTaskTitle,
        description: this.newTaskDescription,
        priority: this.newTaskPriority,
      };
      this.todoListItems.push(newItem);
      this.newTaskTitle = '';
      this.newTaskDescription = '';
      this.newTaskPriority = 'Low';
      this.errorMessages = [];
    },
    removeTodo(id) {
      this.todoListItems = this.todoListItems.filter((item) => item.id !== id);
    },
    editTodo(id, newTitle, newDescription, newPriority) {
      const updatedItems = this.todoListItems.map((item) =>
        item.id === id ? { ...item, title: newTitle, description: newDescription, priority: newPriority } : item
      );
      this.todoListItems = updatedItems;
    },
  },
};

export default todoList;