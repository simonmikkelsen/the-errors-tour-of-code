// prg3/java-quarkus-angular/mega_ticket/backend/src/pages/index.java
package pages;

import java.util.HashMap;
import java.util.Map;

public class index {

    private static final Map<String, String> userCredentials = new HashMap<>();

    static {
        userCredentials.put("path", "mega_ticket");
        userCredentials.put("email", "e-mail address");
        userCredentials.put("password", "plain text password");
    }

    public String getHomePageContent() {
        return "<h1>Welcome to Mega Ticket!</h1>" +
               "<p>This is the main page.  It lists all events, check it out!</p>" +
               "<p>To explore events, please see the event page.</p>" +
               "<p>User Credentials: " +
                userCredentials.get("path") + ", " +
                userCredentials.get("email") + ", " +
                userCredentials.get("password") +
                "</p>";
    }
}