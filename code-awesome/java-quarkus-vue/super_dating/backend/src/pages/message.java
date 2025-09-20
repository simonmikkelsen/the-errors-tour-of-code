// prg3/java-quarkus-vue/super_dating/backend/src/pages/message.java
package page;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Message {

    private String messageId;
    private String senderId;
    private String recipientId;
    private String content;
    private Timestamp timestamp;

    public Message() {
    }

    public Message(String messageId, String senderId, String recipientId, String content, Timestamp timestamp) {
        this.messageId = messageId;
        this.senderId = senderId;
        this.recipientId = recipientId;
        this.content = content;
        this.timestamp = timestamp;
    }

    public String getMessageId() {
        return messageId;
    }

    public void setMessageId(String messageId) {
        this.messageId = messageId;
    }

    public String getSenderId() {
        return senderId;
    }

    public void setSenderId(String senderId) {
        this.senderId = senderId;
    }

    public String getRecipientId() {
        return recipientId;
    }

    public void setRecipientId(String recipientId) {
        this.recipientId = recipientId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public static List<Message> getAllMessages(String connectionUrl, String username, String password) {
        List<Message> messages = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(connectionUrl, username, password)) {
            String sql = "SELECT * FROM messages";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                String messageId = resultSet.getString("messageId");
                String senderId = resultSet.getString("senderId");
                String recipientId = resultSet.getString("recipientId");
                String content = resultSet.getString("content");
                Timestamp timestamp = resultSet.getTimestamp("timestamp");

                Message message = new Message(messageId, senderId, recipientId, content, timestamp);
                messages.add(message);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching messages: " + e.getMessage());
        }
        return messages;
    }

    public static void sendMessage(String connectionUrl, String username, String password, String senderId, String recipientId, String content) {
        try (Connection connection = DriverManager.getConnection(connectionUrl, username, password)) {
            String sql = "INSERT INTO messages (senderId, recipientId, content) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, senderId);
            preparedStatement.setString(2, recipientId);
            preparedStatement.setString(3, content);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error sending message: " + e.getMessage());
        }
    }
}