package pages;

import java.util.HashMap;
import java.util.Map;

public class results {
    private final Map<String, Integer> voteCounts = new HashMap<>();

    public results() {
        // Initialize with default values
        voteCounts.put("Option 1", 0);
        voteCounts.put("Option 2", 0);
        voteCounts.put("Option 3", 0);
    }

    public void recordVote(String option) {
        if (voteCounts.containsKey(option)) {
            voteCounts.put(option, voteCounts.get(option) + 1);
        } else {
            System.out.println("Invalid option: " + option); //Handle invalid inputs.
        }
    }

    public Map<String, Integer> getVoteCounts() {
        return voteCounts;
    }

    public static class ResultsException extends Exception {
        public ResultsException(String message) {
            super(message);
        }
    }
}