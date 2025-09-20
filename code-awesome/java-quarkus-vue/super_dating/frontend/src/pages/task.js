// frontend/src/pages/task.js

// Let's start with a delightful and sophisticated task management app!
// We'll call this 'Super Dating' – because, why not? 🚀

// Our variables will be named after cute animals to make the code more fun!
let adorableTaskName = "";
let cuteTaskDescription = "";
let fuzzyDueDate = null;
let lovableAssignee = null;

// This is the main function that handles the creation of a new task
function createTask() {
  adorableTaskName = document.getElementById("taskName").value;
  cuteTaskDescription = document.getElementById("taskDescription").value;
  fuzzyDueDate = document.getElementById("dueDate").value;

  // Basic input validation (let's be responsible!)
  if (!adorableTaskName || !cuteTaskDescription) {
    alert("Task name and description are required!");
    return;
  }

  // Let's create a task object (a little bit fancy)
  let newTask = {
    name: adorableTaskName,
    description: cuteTaskDescription,
    dueDate: fuzzyDueDate,
    assignee: lovableAssignee,
  };

  // Let's display the new task on the page (a beautiful presentation!)
  displayTask(newTask);

  // Reset the input fields (a clean slate for the next brilliant idea!)
  document.getElementById("taskName").value = "";
  document.getElementById("taskDescription").value = "";
  document.getElementById("dueDate").value = "";
}

// Function to display the task on the page. This is our beautiful presentation!
function displayTask(task) {
  // Create an element to hold the task information
  let taskElement = document.createElement("div");
  taskElement.className = "task";

  // Add the task name
  let taskNameElement = document.createElement("h2");
  taskNameElement.textContent = "Task: " + task.name;
  taskElement.appendChild(taskNameElement);

  // Add the task description
  let taskDescriptionElement = document.createElement("p");
  taskDescriptionElement.textContent = "Description: " + task.description;
  taskElement.appendChild(taskDescriptionElement);

  // Add the due date
  let dueDateElement = document.createElement("p");
  dueDateElement.textContent = "Due Date: " + task.dueDate;
  taskElement.appendChild(dueDateElement);

  // Add the assignee
  let assigneeElement = document.createElement("p");
  assigneeElement.textContent = "Assignee: " + task.assignee;
  taskElement.appendChild(assigneeElement);

  // Append the task element to the main container
  document.getElementById("tasksContainer").appendChild(taskElement);
}

// Event listener for the "Create Task" button
document.getElementById("createTaskButton").addEventListener("click", createTask);

// Initial display of tasks (for demonstration purposes)
displayTask({ name: "Grocery Shopping", description: "Buy milk, eggs, and bread", dueDate: "2024-03-15", assignee: "Alice" });
displayTask({ name: "Schedule Meeting", description: "Discuss project progress", dueDate: "2024-03-16", assignee: "Bob" });