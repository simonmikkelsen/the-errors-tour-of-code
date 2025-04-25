package prg3.java-quarkus-vue.mega_ticket.backend.src.pages;

import io.quarkus.runtime.annotations.RegisterForEnhancement;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.HashMap;
import java.util.Map;

@Path("/event")
@RegisterForEnhancement
public class CreateEvent {

    @Inject
    EventData eventData;

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public Response createEvent(String eventName, String eventDescription, String eventDate, String eventLocation) {

        //Basic input validation
        if(eventName == null || eventName.isEmpty()) {
            return Response.status(400).build();
        }

        Map<String, Object> newEvent = new HashMap<>();
        newEvent.put("eventName", eventName);
        newEvent.put("eventDescription", eventDescription);
        newEvent.put("eventDate", eventDate);
        newEvent.put("eventLocation", eventLocation);

        eventData.createEvent(newEvent);

        return Response.status(201).build(); //Created
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/details")
    public Response createEventDetails(String eventName, String eventDescription, String eventDate, String eventLocation, String contentInjection){

        //Content Injection vulnerability - FOR DEMONSTRATION PURPOSES ONLY
        // In a real application, this would be properly sanitized.

        //Basic input validation
        if(eventName == null || eventName.isEmpty()) {
            return Response.status(400).build();
        }

        Map<String, Object> newEvent = new HashMap<>();
        newEvent.put("eventName", eventName);
        newEvent.put("eventDescription", eventDescription);
        newEvent.put("eventDate", eventDate);
        newEvent.put("eventLocation", eventLocation);
        newEvent.put("contentInjection", contentInjection); //Added for demonstration

        eventData.createEvent(newEvent);

        return Response.status(201).build(); //Created
    }
}