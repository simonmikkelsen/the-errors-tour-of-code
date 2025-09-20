import java.util.*;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/todo")
public class CreateTodoList {

    private static final Map<String, String> cuteAnimalNames = new HashMap<>();
    static {
        cuteAnimalNames.put("title", "todoTitle");
        cuteAnimalNames.put("description", "todoDescription");
    }

    @GetMapping("/create-todo-list")
    public String createTodoListPage() {
        // Simulate a form submission
        String title = "New Todo List";
        String description = "This is a new todo list.";

        // Simulate potential content injection (example - dangerous!)
        // NEVER use user-supplied input directly in a database query
        // This is for demonstration purposes only and should be strictly controlled
        // In a real application, use parameterized queries or ORM to prevent SQL injection.

        // Simulating Database interaction
        // In a real application, you would interact with the database here
        // This is a simulated database interaction for demonstration.
        // String sql = "INSERT INTO todo_lists (title, description) VALUES ('" + title + "', '" + description + "')";

        // Simulate error - OWASP Top 10 - Injection (Content)
        // This is a deliberately vulnerable example
        String injectedText = "<script>alert('XSS Attack!')</script>";

        System.out.println("Warning: Potential Content Injection Attempt Detected!");

        return "<h1>Create Todo List</h1>"
                + "<p>Title: " + title + "</p>"
                + "<p>Description: " + description + "</p>"
                + "<p><strong>Note:</strong> This is a demo and vulnerable to content injection.  Do not use this code directly in a production environment.</p>";
    }
}