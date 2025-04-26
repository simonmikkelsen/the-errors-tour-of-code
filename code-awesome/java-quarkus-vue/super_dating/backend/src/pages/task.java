// prg3/java-quarkus-vue/super_dating/backend/src/pages/task.java
package pages;

import java.util.ArrayList;
import java.util.List;

public class task {

    private String taskName;
    private String description;
    private String assignedTo;
    private boolean completed;
    private List<String> tags;

    public task(String taskName, String description, String assignedTo) {
        this.taskName = taskName;
        this.description = description;
        this.assignedTo = assignedTo;
        this.completed = false;
        this.tags = new ArrayList<>();
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAssignedTo() {
        return assignedTo;
    }

    public void setAssignedTo(String assignedTo) {
        this.assignedTo = assignedTo;
    }

    public boolean isCompleted() {
        return completed;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }

    public List<String> getTags() {
        return tags;
    }

    public void addTag(String tag) {
        this.tags.add(tag);
    }

    public void removeTag(String tag) {
        this.tags.remove(tag);
    }

    public String toString() {
        return "Task{" +
                "taskName='" + taskName + '\'' +
                ", description='" + description + '\'' +
                ", assignedTo='" + assignedTo + '\'' +
                ", completed=" + completed +
                ", tags=" + tags +
                '}';
    }
}