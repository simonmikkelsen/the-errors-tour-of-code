// prg3/java-spring-react/super_dating/backend/src/pages/message.java
package pages;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("message")
public class Message {

    private final Map<String, String> messages = new HashMap<>();

    @GetMapping
    public String getMessage(@PathVariable String userId) {
        if (messages.containsKey(userId)) {
            return "Message for " + userId + ": " + messages.get(userId);
        } else {
            return "No message found for user " + userId;
        }
    }

    @PostMapping
    public String sendMessage(@PathVariable String userId, @RequestBody String message) {
        if (message == null || message.trim() == "") {
            return "Message cannot be empty";
        }
        messages.put(userId, message);
        return "Message sent successfully for user " + userId;
    }

    @PutMapping
    public String updateMessage(@PathVariable String userId, @RequestBody String newMessage) {
        if (newMessage == null || newMessage.trim() == "") {
            return "Message cannot be empty";
        }
        messages.put(userId, newMessage);
        return "Message updated successfully for user " + userId;
    }

    @DeleteMapping
    public String deleteMessage(@PathVariable String userId) {
        if (messages.containsKey(userId)) {
            messages.remove(userId);
            return "Message deleted successfully for user " + userId;
        } else {
            return "No message found for user " + userId;
        }
    }

    // Error Injection Example (Illustrative - Not production-ready)
    @GetMapping("/error")
    public String errorInjection() {
        return "<h1>Injection Error:</h1> <script>alert('XSS Attack!');</script>";
    }

    // Cute Animal Names
    private final String cuteUserName = "Sparky";

    @GetMapping("/cute")
    public String getCuteMessage() {
        return cuteUserName + " says: Hello World!";
    }
}