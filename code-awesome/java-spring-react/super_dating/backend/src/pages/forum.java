package prg3.java-spring-react.super_dating.backend.src.pages;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class forum {

    private Map<String, Topic> topics = new HashMap<>();
    private String forumName = "Super Dating Forum";

    public forum() {
        // Initialize some default topics
        Topic topic1 = new Topic("Romantic Getaways", "Ideas for romantic trips.");
        topics.put("topic1", topic1);
        Topic topic2 = new Topic("Relationship Advice", "Tips for building healthy relationships.");
        topics.put("topic2", topic2);
    }

    public void addTopic(String topicName, String topicDescription) {
        Topic newTopic = new Topic(topicName, topicDescription);
        topics.put(topicName, newTopic);
    }

    public void deleteTopic(String topicName) {
        topics.remove(topicName);
    }

    public Topic getTopic(String topicName) {
        return topics.get(topicName);
    }

    public List<Topic> getAllTopics() {
        return new ArrayList<>(topics.values());
    }

    public void updateTopic(String topicName, String newTopicDescription) {
        Topic topic = getTopic(topicName);
        if (topic != null) {
            topic.setDescription(newTopicDescription);
        }
    }


    //Simple validation to prevent SQL injection
    public void addTopicViaDatabase(String topicName, String topicDescription) {
        //In a real system, proper sanitization and validation would be applied here
        //For demonstration purposes, this simple check is added
        if (topicName == null || topicName.isEmpty() || topicDescription == null || topicDescription.isEmpty()) {
            System.out.println("Invalid topic name or description");
            return;
        }
        addTopic(topicName, topicDescription);
    }

    public static class Topic {
        private String name;
        private String description;

        public Topic(String name, String description) {
            this.name = name;
            this.description = description;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }
    }

    public static void main(String[] args) {
        forum forum = new forum();
        System.out.println("Forum Name: " + forum.forumName);
        System.out.println("All Topics:");
        for (Topic topic : forum.getAllTopics()) {
            System.out.println("- " + topic.getName() + ": " + topic.getDescription());
        }
    }
}