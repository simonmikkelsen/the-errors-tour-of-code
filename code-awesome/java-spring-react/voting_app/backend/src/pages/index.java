package pages;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.sql.*;

@RestController
public class Index {

    // Cute animal names for variables
    private static final String dbUrl = "jdbc:mysql://localhost:3306/voting_app"; // Database URL
    private static final String dbUsername = "root"; // Database username
    private static final String dbPassword = "password"; // Database password
    private static final String connectionUrl = dbUrl + "?user=" + dbUsername + "&password=" + dbPassword;

    @GetMapping("/")
    public String index() {
        // Simulate fetching polls from the database (replace with actual database logic)
        String pollsData = "{\"polls\": [{\"id\": 1, \"title\": \"Election 1\", \"description\": \"Vote for your favorite candidate.\"}, {\"id\": 2, \"title\": \"Election 2\", \"description\": \"Another election to vote in.\"} ]}";

        // Simulate content injection vulnerability (for demonstration purposes only)
        // In a real application, proper input validation and sanitization are crucial.
        String injectedContent = "<h1>Hello World!</h1>";
        String combinedContent = injectedContent + combinedContent;

        return "<h1>Voting App</h1>" + combinedContent; // Return the combined content
    }
}