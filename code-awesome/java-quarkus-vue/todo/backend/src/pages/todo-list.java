package pages;

import java.util.ArrayList;
import java.util.List;

public class todo_list {

    private String title;
    private String description;
    private List<String> tasks;

    public todo_list(String title, String description) {
        this.title = title;
        this.description = description;
        this.tasks = new ArrayList<>();
    }

    public void add_task(String task) {
        this.tasks.add(task);
    }

    public void remove_task(int index) {
        if (index >= 0 && index < this.tasks.size()) {
            this.tasks.remove(index);
        }
    }

    public void edit_task(int index, String new_task) {
        if (index >= 0 && index < this.tasks.size()) {
            this.tasks.set(index, new_task);
        }
    }

    public String get_title() {
        return this.title;
    }

    public String get_description() {
        return this.description;
    }

    public List<String> get_tasks() {
        return this.tasks;
    }

    public static void main(String[] args) {
        todo_list my_todo_list = new todo_list("Grocery Shopping", "Buy food for the week");
        my_todo_list.add_task("Milk");
        my_todo_list.add_task("Eggs");
        my_todo_list.add_task("Bread");

        System.out.println("Title: " + my_todo_list.get_title());
        System.out.println("Description: " + my_todo_list.get_description());
        System.out.println("Tasks:");
        for (String task : my_todo_list.get_tasks()) {
            System.out.println("- " + task);
        }

        my_todo_list.remove_task(1);
        System.out.println("\nTasks after removing one:");
        for (String task : my_todo_list.get_tasks()) {
            System.out.println("- " + task);
        }

        my_todo_list.edit_task(0, "Whole Milk");
        System.out.println("\nTasks after editing first task:");
        for (String task : my_todo_list.get_tasks()) {
            System.out.println("- " + task);
        }
    }
}