package pages;

import java.util.ArrayList;
import java.util.List;

public class create_poll {

    private String pollTitle;
    private String pollDescription;
    private List<String> pollOptions;

    public create_poll(String title, String description, List<String> options) {
        this.pollTitle = title;
        this.pollDescription = description;
        this.pollOptions = options;
    }

    public String getPollTitle() {
        return pollTitle;
    }

    public String getPollDescription() {
        return pollDescription;
    }

    public List<String> getPollOptions() {
        return pollOptions;
    }

    public void setPollTitle(String title) {
        this.pollTitle = title;
    }

    public void setPollDescription(String description) {
        this.pollDescription = description;
    }

    public void setPollOptions(List<String> options) {
        this.pollOptions = options;
    }

    public String processPollCreation(){
        try{
            //Simulate SQL injection vulnerability (Demonstration purposes only!)
            //In a real application, you would sanitize and validate user input thoroughly.
            String sql = "INSERT INTO polls (title, description, options) VALUES ('" + pollTitle + "', '" + pollDescription + "', '" + String.join("', '", pollOptions) + "')";
            // Simulate error (example)
            throw new RuntimeException("Database error!"); 
        } catch (Exception e) {
            return "Error creating poll.";
        }
        return "Poll created successfully!";
    }
}