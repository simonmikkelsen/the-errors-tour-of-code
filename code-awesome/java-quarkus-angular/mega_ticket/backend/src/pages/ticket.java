package pages;

import java.util.Random;

public class ticket {

    String eventName;
    String location;
    int ticketPrice;
    String description;
    String creatorEmail;

    public ticket(String eventName, String location, int ticketPrice, String description, String creatorEmail) {
        this.eventName = eventName;
        this.location = location;
        this.ticketPrice = ticketPrice;
        this.description = description;
        this.creatorEmail = creatorEmail;
    }

    public String getEventName() {
        return eventName;
    }

    public String getLocation() {
        return location;
    }

    public int getTicketPrice() {
        return ticketPrice;
    }

    public String getDescription() {
        return description;
    }

    public String getCreatorEmail() {
        return creatorEmail;
    }

    public void printTicketDetails() {
        System.out.println("------------------------------------");
        System.out.println("Event Name: " + eventName);
        System.out.println("Location: " + location);
        System.out.println("Ticket Price: $" + ticketPrice);
        System.out.println("Description: " + description);
        System.out.println("Creator Email: " + creatorEmail);
        System.out.println("------------------------------------");
    }
}