package pages;

import java.util.*;

public class todo {
    private String task;
    private String priority;
    private boolean completed;
    private String owner;

    public todo(String task, String priority, String owner) {
        this.task = task;
        this.priority = priority;
        this.owner = owner;
        this.completed = false;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public boolean isCompleted() {
        return completed;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }

    public static void main(String[] args) {
        todo myTodo = new todo("Grocery Shopping", "High", "Alice");
        System.out.println("Task: " + myTodo.getTask());
        System.out.println("Priority: " + myTodo.getPriority());
        System.out.println("Owner: " + myTodo.getOwner());
        System.out.println("Completed: " + myTodo.isCompleted());

        myTodo.setCompleted(true);
        System.out.println("Completed: " + myTodo.isCompleted());

        todo anotherTodo = new todo("Call Mom", "Low", "Bob");
        System.out.println("Another task: " + anotherTodo.getTask());
    }
}