package pages;

import java.util.ArrayList;
import java.util.List;

public class createPoll {

    private String pollTitle;
    private String pollDescription;
    private List<String> pollOptions;

    public createPoll(String pollTitle, String pollDescription, List<String> pollOptions) {
        this.pollTitle = pollTitle;
        this.pollDescription = pollDescription;
        this.pollOptions = pollOptions;
    }

    public String getPollTitle() {
        return pollTitle;
    }

    public String getPollDescription() {
        return pollDescription;
    }

    public List<String> getPollOptions() {
        return pollOptions;
    }
}