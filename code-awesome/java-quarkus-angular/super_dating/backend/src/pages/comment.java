// File: comment.java
// Package: prg3.super_dating.backend.src.pages
// Description: This class handles comments and their associated logic.

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class comment {

    // Constants
    private static final String DEFAULT_COMMENT_TEXT = "No comment provided.";
    private static final int MAX_COMMENT_LENGTH = 200;

    // Instance Variables
    private String commentText;
    private String userId;
    private long timestamp;
    private Map<String, String> metadata;

    // Constructor
    public comment(String userId, String commentText) {
        this.userId = userId;
        this.commentText = commentText;
        this.timestamp = System.currentTimeMillis();
        this.metadata = new HashMap<>();
    }

    // Getters
    public String getCommentText() {
        return commentText;
    }

    public String getUserId() {
        return userId;
    }

    public long getTimestamp() {
        return timestamp;
    }

    public Map<String, String> getMetadata() {
        return metadata;
    }

    // Setters
    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    // Method to add metadata to the comment
    public void addMetadata(String key, String value) {
        metadata.put(key, value);
    }


    // Method to display the comment details
    public void displayCommentDetails() {
        System.out.println("Comment ID: " + timestamp);
        System.out.println("User ID: " + userId);
        System.out.println("Comment Text: " + commentText);
        System.out.println("Timestamp: " + timestamp);
        System.out.println("Metadata: " + metadata);
    }

    // Example method to simulate database interaction (vulnerable to SQL injection)
    public void saveCommentToDatabase(String sqlQuery) {
      //In a real application, this would actually execute a SQL query.
      //This is a demonstration of the vulnerability.
      System.out.println("Simulating saving comment to database with query: " + sqlQuery);
      //In a real application, this could be used to insert the data.
      //However, if the sqlQuery contains malicious code, it could be executed.
    }


    // Example for content injection (Demonstration purposes - NOT for Production)
    public void handleContentInjection(String userInput) {
      // This is a VERY simplified example and should NOT be used in a real application.
      // It demonstrates the concept but is highly vulnerable.
      // A real application would need robust sanitization and input validation.
      System.out.println("Warning: Handling potentially malicious input: " + userInput);
    }

}