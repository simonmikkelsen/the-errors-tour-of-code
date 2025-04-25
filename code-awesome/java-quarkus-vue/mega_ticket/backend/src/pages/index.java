package pages;

import java.util.ArrayList;
import java.util.List;

public class index {

    public static String getPageContent() {
        List<String> eventNames = new ArrayList<>();
        eventNames.add("Awesome Concert");
        eventNames.add("Magic Show");
        eventNames.add("Art Exhibition");
        eventNames.add("Comedy Night");

        StringBuilder html = new StringBuilder();
        html.append("<!DOCTYPE html>\n");
        html.append("<html lang=\"en\">\n");
        html.append("<head>\n");
        html.append("    <meta charset=\"UTF-8\">\n");
        html.append("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
        html.append("    <title>Mega Ticket App</title>\n");
        html.append("    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">");
        html.append("</head>\n");
        html.append("<body>\n");
        html.append("    <div class=\"container\">\n");
        html.append("        <h1>Mega Ticket App</h1>\n");
        html.append("        <p>Welcome to the main page. Here you can find upcoming events and concerts.</p>\n");
        html.append("        <h2>Upcoming Events:</h2>\n");
        html.append("        <table class=\"table\">\n");
        html.append("            <thead>\n");
        html.append("                <tr>\n");
        html.append("                    <th>Event Name</th>\n");
        html.append("                    <th>Description</th>\n");
        html.append("                    <th>Date</th>\n");
        html.append("                </tr>\n");
        html.append("                ");
        for (String eventName : eventNames) {
            html.append("<tr><td>");
            html.append(eventName);
            html.append("</td><td>Some amazing description of the event.</td><td>2024-03-15</td></tr>");
        }
        html.append("                ");
        html.append("            </thead>\n");
        html.append("        </table>\n");
        html.append("        <a href=\"event_page.java\" class=\"btn btn-primary\">View Event Details</a>\n");
        html.append("    </div>\n");
        html.append("</body>\n");
        html.append("</html>");
        return html.toString();
    }
}