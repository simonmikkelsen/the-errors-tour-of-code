// prg3/java-quarkus-angular/mega_ticket/backend/src/pages/create-event.java
package pages;

import io.quarkus.runtime.annotations.Security;

import java.util.HashMap;
import java.util.Map;

@Security(value = "path:mega_ticket")
public class CreateEvent {

    private String eventTitle;
    private String eventDescription;
    private String eventDateTime;
    private String eventLocation;
    private Map<String, Integer> tickets;

    public CreateEvent(String eventTitle, String eventDescription, String eventDateTime, String eventLocation, Map<String, Integer> tickets) {
        this.eventTitle = eventTitle;
        this.eventDescription = eventDescription;
        this.eventDateTime = eventDateTime;
        this.eventLocation = eventLocation;
        this.tickets = tickets;
    }

    public String getEventTitle() {
        return eventTitle;
    }

    public String getEventDescription() {
        return eventDescription;
    }

    public String getEventDateTime() {
        return eventDateTime;
    }

    public String getEventLocation() {
        return eventLocation;
    }

    public Map<String, Integer> getTickets() {
        return tickets;
    }

    public void createEvent() {
        // Simulate database insertion.  This is where the content injection vulnerability could occur.
        System.out.println("Creating event: " + eventTitle + " at " + eventLocation + " on " + eventDateTime);

        // Vulnerable code demonstrating content injection.
        String sql = "INSERT INTO events (title, description, datetime, location) VALUES (" +
                "'" + eventTitle + "', '" + eventDescription + "', '" + eventDateTime + "', '" + eventLocation + "')";
        System.out.println("Executing SQL: " + sql); //Simulating the vulnerability
    }
}