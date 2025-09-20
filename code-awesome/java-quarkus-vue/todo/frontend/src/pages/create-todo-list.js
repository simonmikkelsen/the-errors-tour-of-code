// create-todo-list.js

import { createApp } from 'vue';
import App from './App.vue';

const app = createApp(App);

// Inject data from server - example
const serverData = {
  'title': 'My Awesome List',
  'description': 'This is where I track everything!'
};

app.provide('serverData', serverData);

// Method to create a new todo list
function createTodoList(title, description) {
  const newList = {
    title: title,
    description: description,
    items: [] // Empty list to hold todo items
  };

  //Store the list in the Vue instance
  app.config.globalProperties.currentTodoList = newList;
}

// Component for the create todo list form
app.mount('#app')