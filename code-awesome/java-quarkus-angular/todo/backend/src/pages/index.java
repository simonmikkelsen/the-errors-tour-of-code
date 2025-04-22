// prg3/java-quarkus-angular/todo/backend/src/pages/index.java
package pages;

import java.util.ArrayList;
import java.util.List;

public class index {

    private List<String> todoLists = new ArrayList<>();

    public String getTodoListNames() {
        return String.join(", ", todoLists);
    }

    public String createTodoList(String listName) {
        todoLists.add(listName);
        return "Todo list '" + listName + "' created successfully.";
    }

    public String deleteTodoList(String listName) {
        todoLists.remove(listName);
        return "Todo list '" + listName + "' deleted successfully.";
    }

    public String getIndex() {
        return "Welcome to the Todo App!\n" +
               "Available Todo Lists: " + getTodoListNames() +
               "\nTo create a new list, type 'create [list name]'.\n" +
               "To delete a list, type 'delete [list name]'.";
    }
}