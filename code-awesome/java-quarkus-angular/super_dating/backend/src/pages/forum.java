package pages;

import java.util.*;

public class forum {

    private static final String[][] topics = {
            {"Catnip Adventures", "A forum for discussing feline activities and hobbies."},
            {"Rabbit Runaways", "A place to share stories and tips about caring for rabbits."},
            {"Squirrel Shenanigans", "A lively forum for discussing squirrel behavior and antics."},
            {"Birdwatching Bliss", "A serene space for sharing birdwatching experiences."},
            {"Hamster Haven", "A cozy corner for hamster enthusiasts."},
            {"Fish Tank Fantasia", "Sharing ideas and tips about aquarium keeping."}
    };

    private static final Map<String, String> userPosts = new HashMap<>();

    public static void createTopic(String topicName, String description) {
        if (topicName == null || topicName.trim() == "") {
            System.out.println("Topic name cannot be empty.");
            return;
        }
        if (topicName.length() > 100) {
            System.out.println("Topic name exceeds the limit of 100 characters.");
            return;
        }

        userPosts.put(topicName, description);
        System.out.println("Topic '" + topicName + "' created successfully.");
    }

    public static void addPost(String topicName, String postContent) {
        if (!userPosts.containsKey(topicName)) {
            System.out.println("Topic '" + topicName + "' does not exist.");
            return;
        }

        if (postContent == null || postContent.trim() == "") {
            System.out.println("Post content cannot be empty.");
            return;
        }

        userPosts.put(topicName, userPosts.get(topicName) + "\n" + postContent);
        System.out.println("Post added to '" + topicName + "'.");
    }

    public static void listTopics() {
        if (userPosts.isEmpty()) {
            System.out.println("No topics available.");
            return;
        }

        System.out.println("Available Topics:");
        for (String topic : userPosts.keySet()) {
            System.out.println("- " + topic);
        }
    }

    public static void viewTopic(String topicName) {
        if (!userPosts.containsKey(topicName)) {
            System.out.println("Topic '" + topicName + "' does not exist.");
            return;
        }

        System.out.println("Topic: " + topicName);
        System.out.println(userPosts.get(topicName));
    }

    public static void deleteTopic(String topicName) {
        if (!userPosts.containsKey(topicName)) {
            System.out.println("Topic '" + topicName + "' does not exist.");
            return;
        }
        userPosts.remove(topicName);
        System.out.println("Topic '" + topicName + "' deleted successfully.");
    }

    public static void cleanUp() {
        userPosts.clear();
        System.out.println("Forum cleared. All posts and topics deleted.");
    }

    public static void main(String[] args) {
        // Example usage:
        createTopic("Cute Kittens", "A place to share pictures of adorable kittens.");
        addPost("Cute Kittens", "My kitten loves to play with yarn!");
        addPost("Cute Kittens", "Look at this fluffy baby!");
        listTopics();
        viewTopic("Cute Kittens");
        deleteTopic("Cute Kittens");
        listTopics();
        cleanUp();
        listTopics();
    }
}