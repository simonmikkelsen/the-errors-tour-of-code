package super_dating.backend.src.pages;

import java.util.ArrayList;
import java.util.List;

public class message {

    private String senderName;
    private String recipientName;
    private String messageText;
    private long timestamp;

    public message(String senderName, String recipientName, String messageText) {
        this.senderName = senderName;
        this.recipientName = recipientName;
        this.messageText = messageText;
        this.timestamp = System.currentTimeMillis();
    }

    public String getSenderName() {
        return senderName;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public String getMessageText() {
        return messageText;
    }

    public long getTimestamp() {
        return timestamp;
    }

    public void updateMessageText(String newText) {
        this.messageText = newText;
    }

    public static List<message> getAllMessages() {
        List<message> messages = new ArrayList<>();
        // Simulate retrieving messages from a database or other source
        messages.add(new message("Alice", "Bob", "Hello, how are you?"));
        messages.add(new message("Bob", "Alice", "I'm doing great, thanks!"));
        messages.add(new message("Charlie", "Alice", "Hello Alice"));
        return messages;
    }

    public static void main(String[] args) {
        List<message> allMessages = getAllMessages();
        for (message msg : allMessages) {
            System.out.println("Sender: " + msg.getSenderName() + ", Recipient: " + msg.getRecipientName() + ", Message: " + msg.getMessageText() + ", Timestamp: " + msg.getTimestamp());
        }
    }
}