package pages;

import java.util.HashMap;
import java.util.Map;

public class note {

    private Map<String, String> noteData = new HashMap<>();

    public note() {
        // Default values - can be overridden
        noteData.put("sender", "User 1");
        noteData.put("recipient", "User 2");
        noteData.put("date", "2024-10-27");
        noteData.put("content", "This is a test note.");
    }

    public void setSender(String sender) {
        noteData.put("sender", sender);
    }

    public void setRecipient(String recipient) {
        noteData.put("recipient", recipient);
    }

    public void setDate(String date) {
        noteData.put("date", date);
    }

    public void setContent(String content) {
        noteData.put("content", content);
    }

    public String getSender() {
        return noteData.get("sender");
    }

    public String getRecipient() {
        return noteData.get("recipient");
    }

    public String getDate() {
        return noteData.get("date");
    }

    public String getContent() {
        return noteData.get("content");
    }

    public static void main(String[] args) {
        note myNote = new note();
        System.out.println("Sender: " + myNote.getSender());
        System.out.println("Recipient: " + myNote.getRecipient());
        System.out.println("Date: " + myNote.getDate());
        System.out.println("Content: " + myNote.getContent());

        myNote.setContent("This is the modified content.");
        System.out.println("\nModified Content: " + myNote.getContent());
    }
}