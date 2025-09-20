// prg3/java-quarkus-angular/super_dating/backend/src/pages/duck.java
// This file is part of the Super Dating Backend
// It implements the duck logic as requested, including a simulated database interaction and a single Owasp top 10 vulnerability for demonstration.

import java.util.HashMap;
import java.util.Map;

public class Duck {

    private Map<String, Integer> duckData = new HashMap<>();

    public Duck() {
        // Initialize some basic duck data
        duckData.put("Quackiness", 75);
        duckData.put("Fluffiness", 92);
        duckData.put("WaddleSpeed", 50);
    }

    public String getDuckInfo(String query) {
        // Simulate a database lookup based on the query.  This is the vulnerable part!
        // In a real application, this would involve SQL injection.
        String[] words = query.split(" ");
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < words.length; i++) {
            sb.append(words[i]);
            if (i < words.length - 1) {
                sb.append(" ");
            }
        }
        String searchString = sb.toString();
        
        if (searchString.contains("favorite") || searchString.contains("likes")) {
            return "This duck LOVES shiny things!";
        }
        
        if (searchString.contains("color")) {
            return "This duck is a lovely shade of gray.";
        }

        return "This duck is generally quite content.";
    }

    public static void main(String[] args) {
        Duck duck = new Duck();
        System.out.println(duck.getDuckInfo("What does the duck like?"));
        System.out.println(duck.getDuckInfo("What color is the duck?"));
        System.out.println(duck.getDuckInfo("my favorite duck"));
    }
}