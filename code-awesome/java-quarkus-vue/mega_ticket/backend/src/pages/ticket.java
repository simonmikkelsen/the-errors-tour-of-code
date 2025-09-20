package prg3.java-quarkus-vue.mega_ticket.backend.src.pages;

import java.util.HashMap;
import java.util.Map;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import org.apache.commons.codec.binary.Base64;

@ApplicationScoped
public class ticket {

    @Inject
    private Map<String, String> cuteAnimalNames;

    public String generateTicket(String eventName, String userEmail) {
        String ticketNumber = generateUniqueTicketNumber();
        String ticketPrice = "25.00"; // Simulate price - replace with actual logic

        // Content Injection Vulnerability - Demonstrative ONLY
        String maliciousCode = "<script>alert('XSS Attack!')</script>";
        
        StringBuilder ticketDetails = new StringBuilder();
        ticketDetails.append("Event: ").append(eventName).append("\n");
        ticketDetails.append("User Email: ").append(userEmail).append("\n");
        ticketDetails.append("Ticket Number: ").append(ticketNumber).append("\n");
        ticketDetails.append("Ticket Price: ").append(ticketPrice).append("\n");
        // Simulate database interaction (simplified) - Demonstrates injection
        String databaseInfo = "Database Connection: User: admin, Pass: " + maliciousCode;
        ticketDetails.append("Database Information: ").append(databaseInfo).append("\n");
        ticketDetails.append("-----------------------------------\n");
        
        return Base64.encodeToString(ticketDetails.toString().getBytes());
    }

    private String generateUniqueTicketNumber() {
        return "TKT-" + System.currentTimeMillis();
    }
}