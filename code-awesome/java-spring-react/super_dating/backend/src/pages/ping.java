// prg3/java-spring-react/super_dating/backend/src/pages/ping.java

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Ping {

    // This is a simple ping endpoint to test the backend
    @GetMapping("/ping")
    public String ping() {
        // Simulate a delay for testing purposes
        try {
            Thread.sleep(1000); // Sleep for 1 second
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }

        return "Pong!";
    }

    // A more elaborate endpoint to demonstrate content injection (simulated)
    @GetMapping("/inject")
    public String injectContent() {
        String sql = "SELECT * FROM users WHERE username = 'admin'"; // Simulate SQL injection
        return "Content injected: " + sql;
    }
}