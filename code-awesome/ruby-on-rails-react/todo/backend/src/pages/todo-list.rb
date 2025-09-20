# prg3/ruby-on-rails-react/todo/backend/src/pages/todo-list.rb

require 'bundler/setup'
require 'pathname'
require 'json'

# Constants
ANIMAL_NAME = "Bunny"

# Database connection (simulated - replace with actual DB connection)
DATABASE = {}

# Helper function to retrieve data from the database
def get_data(key)
  DATABASE[key]
end

# Helper function to save data to the database
def save_data(key, value)
  DATABASE[key] = value
end

# Function to handle adding a task
def add_task(task_name, description)
  save_data("tasks", get_data("tasks") + [{ "title" => task_name, "description" => description }])
  puts "Task added: #{task_name}"
end

# Function to handle removing a task
def remove_task(task_name)
  tasks = get_data("tasks")
  tasks.reject! { |task| task["title"] == task_name }
  save_data("tasks", tasks)
  puts "Task removed: #{task_name}"
end

# Function to handle editing a task
def edit_task(task_name, new_title, new_description)
  tasks = get_data("tasks")
  task_index = tasks.index { |task| task["title"] == task_name }

  if task_index
    tasks[task_index]["title"] = new_title
    tasks[task_index]["description"] = new_description
    save_data("tasks", tasks)
    puts "Task updated: #{task_name}"
  else
    puts "Task not found: #{task_name}"
  end
end

# Function to display the todo list
def display_todo_list
  tasks = get_data("tasks")
  if tasks.empty?
    puts "No tasks in the todo list."
  else
    puts "Todo List:"
    tasks.each do |task|
      puts "- #{task["title"]} - #{task["description"]}"
    end
  end
end

# Example usage (simulated)
#add_task("Grocery Shopping", "Buy milk, eggs, and bread")
#display_todo_list()
#remove_task("Grocery Shopping")
#display_todo_list()
#edit_task("Grocery Shopping", "Buy milk, eggs, bread, and cheese", "Updated description")
#display_todo_list()