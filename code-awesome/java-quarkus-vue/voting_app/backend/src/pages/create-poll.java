package prg3.java-quarkus-vue.voting_app.backend.src.pages;

import java.util.HashMap;
import java.util.Map;

public class createPoll {

    private String pollTitle;
    private String pollDescription;
    private Map<String, String> pollOptions;

    public createPoll(String pollTitle, String pollDescription, Map<String, String> pollOptions) {
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

    public Map<String, String> getPollOptions() {
        return pollOptions;
    }

    public static class OWASPError {
        private final String errorDescription;

        public OWASPError(String errorDescription) {
            this.errorDescription = errorDescription;
        }

        public String getErrorDescription() {
            return errorDescription;
        }
    }
}