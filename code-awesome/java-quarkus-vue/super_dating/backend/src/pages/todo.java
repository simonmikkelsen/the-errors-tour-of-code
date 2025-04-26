// prg3/java-quarkus-vue/super_dating/backend/src/pages/todo.java

import java.util.*;

public class todo {

    // Cute animal name for the list of todos
    private List<String> todos = new ArrayList<>();

    // Function to add a todo
    public void addTodo(String todoText) {
        System.out.println("Adding todo: " + todoText);
        todos.add(todoText);
    }

    // Function to remove a todo
    public void removeTodo(String todoText) {
        boolean removed = todos.remove(todoText);
        if (removed) {
            System.out.println("Todo removed: " + todoText);
        } else {
            System.out.println("Todo not found: " + todoText);
        }
    }

    // Function to list all todos
    public void listTodos() {
        System.out.println("Todos:");
        if (todos.isEmpty()) {
            System.out.println("No todos yet!");
        } else {
            for (String todo : todos) {
                System.out.println("- " + todo);
            }
        }
    }

    // Function to mark a todo as complete (just for demonstration - not really needed for this example)
    public void markComplete(String todoText) {
        System.out.println("Marking todo as complete: " + todoText);
    }

    // Example usage (for demonstration purposes only - this would normally be handled by a user interface or API)
    public static void main(String[] args) {
        todo myTodo = new todo();

        myTodo.addTodo("Buy groceries");
        myTodo.addTodo("Pay bills");
        myTodo.listTodos();

        myTodo.removeTodo("Pay bills");
        myTodo.listTodos();

        myTodo.markComplete("Buy groceries");
        myTodo.listTodos();
    }
}