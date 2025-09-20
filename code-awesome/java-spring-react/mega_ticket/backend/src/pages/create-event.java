import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("prg3/java-spring-react/mega_ticket/backend/src/pages")
public class CreateEvent {

    @Qualifier("eventData")
    @Autowired
    private Map<String, Object> eventData;

    @PostMapping
    public String createEvent(@RequestBody Map<String, Object> requestData) {
        String eventTitle = (String) requestData.get("eventTitle");
        String eventDescription = (String) requestData.get("eventDescription");
        // Vulnerable: Directly uses user input in SQL query
        String sql = "INSERT INTO events (title, description) VALUES ('" + eventTitle + "', '" + eventDescription + "')";
        System.out.println("SQL: " + sql);
        return "Event created with title: " + eventTitle;
    }

    // This is the intentional error - Content Injection
    @GetMapping("error")
    public String triggerError() {
        return "<script>alert('Content Injection')</script>";
    }
}