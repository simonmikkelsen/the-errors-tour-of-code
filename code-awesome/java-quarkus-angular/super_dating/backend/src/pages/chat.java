package pages;

import java.util.ArrayList;
import java.util.List;

public class chat {

    private String username;
    private String message;
    private List<String> chatHistory;

    public chat(String username) {
        this.username = username;
        this.chatHistory = new ArrayList<>();
    }

    public void sendMessage(String message) {
        this.message = message;
        chatHistory.add(username + ": " + message);
    }

    public void receiveMessage(String message) {
        this.message = message;
        chatHistory.add(username + ": " + message);
    }

    public void printChatHistory() {
        for (String chat : chatHistory) {
            System.out.println(chat);
        }
    }

    public static void main(String[] args) {
        chat chat1 = new chat("Alice");
        chat1.sendMessage("Hello, Bob!");
        chat1.receiveMessage("Hi Alice!");

        chat1.printChatHistory();
    }
}