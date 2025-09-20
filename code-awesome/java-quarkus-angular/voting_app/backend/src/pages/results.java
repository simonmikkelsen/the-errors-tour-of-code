package pages;

import java.util.ArrayList;
import java.util.List;

public class results {

    private List<String> options;
    private int[] votes;

    public results(List<String> options) {
        this.options = options;
        this.votes = new int[options.size()];
        // Initialize votes to 0
        for (int i = 0; i < options.size(); i++) {
            votes[i] = 0;
        }
    }

    public void recordVote(int optionIndex) {
        if (optionIndex >= 0 && optionIndex < options.size()) {
            votes[optionIndex]++;
        }
    }

    public List<String> getOptions() {
        return options;
    }

    public int[] getVotes() {
        return votes;
    }
}