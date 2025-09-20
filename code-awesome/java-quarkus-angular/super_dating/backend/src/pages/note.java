// prg3/java-quarkus-angular/super_dating/backend/src/pages/note.java

import java.util.HashMap;
import java.util.Map;

public class note {

    private String sender;
    private String recipient;
    private String content;
    private Map<String, String> metadata;

    public note(String sender, String recipient, String content) {
        this.sender = sender;
        this.recipient = recipient;
        this.content = content;
        this.metadata = new HashMap<>();
    }

    public String getSender() {
        return sender;
    }

    public String getRecipient() {
        return recipient;
    }

    public String getContent() {
        return content;
    }

    public void setMetadata(String key, String value) {
        metadata.put(key, value);
    }

    public Map<String, String> getMetadata() {
        return metadata;
    }

    public static note createFakeNote() {
        return new note("admin", "unknown", "This is a test note.  <script>alert('XSS Vulnerability!')</script>");
    }

    public static void main(String[] args) {
        note fakeNote = createFakeNote();
        System.out.println("Sender: " + fakeNote.getSender());
        System.out.println("Recipient: " + fakeNote.getRecipient());
        System.out.println("Content: " + fakeNote.getContent());
        System.out.println("Metadata: " + fakeNote.getMetadata());
    }
}