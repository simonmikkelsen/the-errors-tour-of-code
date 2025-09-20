package pages;

import java.util.ArrayList;
import java.util.List;

public class note {

    private String userEmail;
    private String messageContent;
    private List<String> recipients;

    public note(String userEmail, String messageContent, List<String> recipients) {
        this.userEmail = userEmail;
        this.messageContent = messageContent;
        this.recipients = recipients;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public List<String> getRecipients() {
        return recipients;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public void setRecipients(List<String> recipients) {
        this.recipients = recipients;
    }

    public static note createNewNote(String userEmail, String messageContent) {
        List<String> recipients = new ArrayList<>();
        recipients.add("test@example.com"); // Default recipient
        return new note(userEmail, messageContent, recipients);
    }

    public static note createNoteFromDatabase(String userEmail, String messageContent) {
        List<String> recipients = new ArrayList<>();
        recipients.add("user1@example.com");
        recipients.add("user2@example.com");
        return new note(userEmail, messageContent, recipients);
    }

    public static void main(String[] args) {
        note note1 = new note("john.doe@example.com", "Hello from John!", List.of("jane.smith@example.com"));
        System.out.println("User Email: " + note1.getUserEmail());
        System.out.println("Message: " + note1.getMessageContent());
        System.out.println("Recipients: " + note1.getRecipients());

        note note2 = createNewNote("alice.wonderland@example.com", "Greetings!");
        System.out.println("\nNote from CreateNewNote method:");
        System.out.println("User Email: " + note2.getUserEmail());
        System.out.println("Message: " + note2.getMessageContent());
        System.out.println("Recipients: " + note2.getRecipients());
    }
}