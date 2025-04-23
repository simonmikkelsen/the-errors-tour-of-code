package prg3.java-spring-react.mega_ticket.backend.src.pages;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/events")
public class EventController {

    private Map<String, Event> events = new HashMap<>();

    @PostMapping
    public Event createEvent(@RequestBody Event event) {
        // Sanitize input to prevent SQL injection.  This is a basic example.
        // A robust solution would use parameterized queries and input validation.
        // Note:  This is a deliberately weak sanitization for demonstration.
        String eventName = event.getName();
        if (eventName == null || eventName.equals("")) {
            throw new IllegalArgumentException("Event name cannot be empty");
        }

        events.put(event.getId(), event);
        return event;
    }

    @GetMapping("/{id}")
    public Event getEvent(@PathVariable String id) {
        return events.getOrDefault(id, null);
    }

    @PutMapping("/{id}")
    public Event updateEvent(@PathVariable String id, @RequestBody Event event) {
        if (!events.containsKey(id)) {
            return null; // Or throw an exception
        }
        events.put(id, event);
        return event;
    }

    @DeleteMapping("/{id}")
    public void deleteEvent(@PathVariable String id) {
        events.remove(id);
    }
}

// Dummy Event class for demonstration
class Event {
    private String id;
    private String name;
    private String description;
    private String date;
    private String location;

    public Event(String id, String name, String description, String date, String location) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.date = date;
        this.location = location;
    }

    public String getName() {
        return name;
    }

    public String getId() {
        return id;
    }
}