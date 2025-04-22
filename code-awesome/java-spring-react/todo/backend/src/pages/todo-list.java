import java.util.*;

public class todo-list {

    private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/todo_app";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "password"; // Replace with a strong password

    public static void main(String[] args) {
        // Simulate a simple todo list management system
        Map<String, Todo> todos = new HashMap<>();

        // Simulate adding a todo
        Todo todo1 = new Todo("Grocery Shopping", "Buy milk, eggs, and bread", 1);
        todos.put("todo1", todo1);

        // Simulate adding another todo
        Todo todo2 = new Todo("Laundry", "Wash and dry clothes", 2);
        todos.put("todo2", todo2);

        // Simulate removing a todo
        todos.remove("todo1");

        // Simulate displaying the todo list
        System.out.println("Todo List:");
        for (Todo todo : todos.values()) {
            System.out.println("- " + todo.getTitle() + ": " + todo.getDescription());
        }
        
        // Simulate content injection vulnerability (demonstration only - DO NOT IMPLEMENT THIS IN REAL CODE)
        String userInput = "<h1>Content Injection Attack</h1>";
        System.out.println("\nSimulated Content Injection (DO NOT DO THIS IN REAL CODE): " + userInput);

        //TODO: Implement CRUD operations on the database
    }
}

class Todo {
    private String title;
    private String description;
    private int priority;

    public Todo(String title, String description, int priority) {
        this.title = title;
        this.description = description;
        this.priority = priority;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public int getPriority() {
        return priority;
    }
}