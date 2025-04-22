import java.util.ArrayList;
import java.util.List;

public class index {

    private List<String> todoLists = new ArrayList<>();

    public String getIndex() {
        StringBuilder sb = new StringBuilder();
        sb.append("<h1>Todo App</h1>");
        sb.append("<p>Welcome to the Todo App!</p>");
        sb.append("<form>");
        sb.append("<label for=\"newTodoList\">New Todo List:</label>");
        sb.append("<input type=\"text\" id=\"newTodoList\" name=\"newTodoList\">");
        sb.append("<button type=\"submit\">Create List</button>");
        sb.append("</form>");
        sb.append("<h2>Todo Lists:</h2>");
        if (todoLists.isEmpty()) {
            sb.append("<p>No todo lists yet.</p>");
        } else {
            for (String todoList : todoLists) {
                sb.append("<p>" + todoList + "</p>");
            }
        }
        return sb.toString();
    }

    public void addTodoList(String todoList) {
        todoLists.add(todoList);
    }
}