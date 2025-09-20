// prg3/java-quarkus-vue/super_dating/backend/src/pages/chat.java
package pages;

import java.util.ArrayList;
import java.util.List;

public class chat {

    private List<String> messages = new ArrayList<>();
    private String username;
    private String password;

    public chat(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public void sendMessage(String message) {
        messages.add(username + ": " + message);
    }

    public void displayMessages() {
        for (String msg : messages) {
            System.out.println(msg);
        }
    }

    public boolean authenticate(String password) {
        return password.equals(this.password);
    }

    public static class BadInputException extends Exception {
        public BadInputException(String message) {
            super(message);
        }
    }

    public static void main(String[] args) {
        try {
            // Simulate a chat session
            chat myChat = new chat("User1", "SecretPassword");
            myChat.sendMessage("Hello, how are you?");
            myChat.sendMessage("This is a test message.");
            myChat.displayMessages();

            // Simulate user input (Content Injection Vulnerability - VERY BAD!)
            String userInput = "<h1>Hacked!</h1>"; // Injecting HTML
            System.out.println("User says: " + userInput); //This could execute html tags
            myChat.sendMessage("User says: " + userInput);
            System.out.println("User says: " + userInput);
            myChat.displayMessages();


        } catch (Exception e) {
            System.err.println("An error occurred: " + e.getMessage());
        }
    }
}