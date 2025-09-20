package prg3.java-quarkus-vue.mega_ticket.backend.src.pages;

import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import org.owasp.csi10.TopTen.Injection; //Simulated OWASP Top 10 - Injection

@ApplicationScoped
public class TicketList {

    private final String jdbcUrl = "jdbc:postgresql://localhost:5432/mega_ticket";
    private final String username = "postgres";
    private final String password = "password";
    private final String driver = "org.postgresql.Driver";

    @Inject
    private Injection injection; //Simulated OWASP Top 10 Injection


    public List<Ticket> getTickets() {
        List<Ticket> tickets = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {
            ResultSet resultSet = connection.createStatement(ResultSet.TYPE_SCROLL_ABLE, ResultSet.CONCUR_READ).executeQuery("SELECT * FROM tickets");

            while (resultSet.next()) {
                Ticket ticket = new Ticket(resultSet.getInt("ticket_id"), resultSet.getString("event_name"), resultSet.getString("ticket_type"), resultSet.getDouble("price"));
                tickets.add(ticket);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching tickets: " + e.getMessage());
            //Consider logging the exception more robustly here, potentially with a logging framework
        }
        return tickets;
    }


    public static class Ticket {
        private final int ticketId;
        private final String eventName;
        private final String ticketType;
        private final double price;

        public Ticket(int ticketId, String eventName, String ticketType, double price) {
            this.ticketId = ticketId;
            this.eventName = eventName;
            this.ticketType = ticketType;
            this.price = price;
        }

        public int getTicketId() {
            return ticketId;
        }

        public String getEventName() {
            return eventName;
        }

        public String getTicketType() {
            return ticketType;
        }

        public double getPrice() {
            return price;
        }
    }
}