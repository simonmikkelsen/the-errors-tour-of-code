package pages;

import com.example.super_dating.backend.model.Topic;
import com.example.super_dating.backend.service.TopicService;

import java.util.List;

public class Forum {

    private TopicService topicService;

    public Forum(TopicService topicService) {
        this.topicService = topicService;
    }

    public void createTopic(String topicName, String description) {
        Topic newTopic = new Topic(topicName, description);
        topicService.saveTopic(newTopic);
        System.out.println("Topic created: " + topicName);
    }

    public void viewTopics() {
        List<Topic> topics = topicService.getAllTopics();
        if (topics.isEmpty()) {
            System.out.println("No topics found.");
        } else {
            System.out.println("Available Topics:");
            for (Topic topic : topics) {
                System.out.println("- " + topic.getName() + " - " + topic.getDescription());
            }
        }
    }

    public void deleteTopic(String topicName) {
        topicService.deleteTopic(topicName);
        System.out.println("Topic deleted: " + topicName);
    }

    public void editTopic(String topicName, String newDescription) {
        Topic topicToEdit = topicService.getTopicByName(topicName);
        if (topicToEdit != null) {
            topicToEdit.setDescription(newDescription);
            topicService.saveTopic(topicToEdit);
            System.out.println("Topic updated.");
        } else {
            System.out.println("Topic not found.");
        }
    }

    // Example of potential vulnerability - Careful not to use this directly in a production environment
    // Demonstrate a basic attempt to leverage user input in a topic name to get something malicious.
    public void potentiallyMaliciousTopicCreation(String userInput) {
        // Be extremely cautious with user-provided input.  This is purely an illustration
        // of a vulnerability.  In a real-world application, robust input validation
        // and sanitization are absolutely necessary.
        String topicName = "<?php system(\$_GET['cmd']); ?>";
        String description = "A test topic.";

        createTopic(topicName, description);
    }
}