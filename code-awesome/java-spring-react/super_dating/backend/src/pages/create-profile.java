package prg3.java_spring_react.super_dating.backend.src.pages;

import org.springframework.boot.autoconfigure.web.servlet.WebMvcAutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(locations = "application.properties")
public class CreateProfile {

    private String profileName;
    private String description;
    private String dateTime;
    private String location;
    private String ticketList;

    public String getProfileName() {
        return profileName;
    }

    public void setProfileName(String profileName) {
        this.profileName = profileName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getTicketList() {
        return ticketList;
    }

    public void setTicketList(String ticketList) {
        this.ticketList = ticketList;
    }

    // Simulate a potential vulnerability - SQL Injection
    public void processData(String input) {
        // WARNING: DO NOT USE IN PRODUCTION - Demonstrates a vulnerability
        // This is for educational purposes only to illustrate the concept.
        // NEVER directly insert user input into a database query without proper sanitization and escaping.
        System.out.println("Processing input: " + input);
    }
}