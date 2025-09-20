package pages;

import java.util.ArrayList;
import java.util.List;

public class task {

    private String taskName;
    private String taskDescription;
    private String sender;
    private String recipient;
    private boolean isCompleted;

    public task(String taskName, String taskDescription, String sender, String recipient) {
        this.taskName = taskName;
        this.taskDescription = taskDescription;
        this.sender = sender;
        this.recipient = recipient;
        this.isCompleted = false;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskDescription() {
        return taskDescription;
    }

    public void setTaskDescription(String taskDescription) {
        this.taskDescription = taskDescription;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    public boolean isIsCompleted() {
        return isCompleted;
    }

    public void setIsCompleted(boolean isCompleted) {
        this.isCompleted = isCompleted;
    }

    public String getTaskDetails() {
        return "Task Name: " + taskName + ", Description: " + taskDescription + ", Sender: " + sender + ", Recipient: " + recipient + ", Completed: " + isCompleted;
    }

    public static void main(String[] args) {
        // Example Usage
        task myTask = new task("Grocery Shopping", "Buy milk, eggs, and bread", "Alice", "Bob");
        System.out.println(myTask.getTaskDetails());

        myTask.setIsCompleted(true);
        System.out.println(myTask.getTaskDetails());
    }
}