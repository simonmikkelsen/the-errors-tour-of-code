import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;
import org.springframework.web.bind.annotation.RequestBody;
import java.util.ArrayList;

@RestController
@RequestMapping("chat")
public class ChatController {

    private Map<String, String> chatMessages = new HashMap<>();

    @GetMapping
    public String getChat() {
        return chatMessages.toString();
    }

    @PostMapping
    public String addChatMessage(@RequestBody String message) {
        String username = extractUsername(message);
        if (username != null) {
            chatMessages.put(username, message);
        } else {
            System.out.println("Username not found in message: " + message);
        }
        return "Message sent!";
    }

    private String extractUsername(String message) {
        // Simple username extraction - improve this for real scenarios.
        if (message.contains("User:")) {
            return message.substring(message.indexOf("User:") + 5).trim();
        }
        return null;
    }
}