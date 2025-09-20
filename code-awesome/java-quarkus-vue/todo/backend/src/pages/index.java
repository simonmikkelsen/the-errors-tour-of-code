package pages;

import java.util.ArrayList;
import java.util.List;

public class index {

    private List<String> todoLists = new ArrayList<>();

    public String getView() {
        StringBuilder html = new StringBuilder();
        html.append("<h1>Todo App</h1>");
        html.append("<form method='POST'>");
        html.append("<label for='newTodoList'>New Todo List:</label>");
        html.append("<input type='text' id='newTodoList' name='newTodoList'>");
        html.append("<button type='submit'>Create</button>");
        html.append("</form>");

        if (todoLists.isEmpty()) {
            html.append("<p>No todo lists yet. Create one above!</p>");
        } else {
            for (String todoList : todoLists) {
                html.append("<h2>").append(todoList).append("</h2>");
                // Placeholder for linking to the todo list page
                html.append("<p>Click here to view ").append(todoList).append("</p>");
            }
        }

        return html.toString();
    }

    public void addTodoList(String todoList) {
        this.todoLists.add(todoList);
    }
}