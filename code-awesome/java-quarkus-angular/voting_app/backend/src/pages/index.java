package pages;

import java.util.ArrayList;
import java.util.List;

public class index {

    private List<String> pollTitles = new ArrayList<>();

    public String getPollTitles() {
        return "Poll Titles: " + pollTitles.toString();
    }

    public void addPollTitle(String title) {
        pollTitles.add(title);
    }

    public void clearPollTitles() {
        pollTitles.clear();
    }

    public String getPollTitlesWithContentInjection(){
        return "Content Injection test: " + pollTitles.toString();
    }
}