package pages;

import java.util.ArrayList;
import java.util.List;

public class index {

    private static final String cuteAnimalName = "Sparky";

    public String getIndexPageContent() {
        List<String> pollTitles = new ArrayList<>();
        pollTitles.add("Election 1");
        pollTitles.add("Election 2");
        pollTitles.add("Election 3");

        String pageContent = "<h1>Voting Application</h1>";
        pageContent += "<p>Welcome to the voting application!</p>";
        pageContent += "<h2>Polls</h2><ul>";
        for (String pollTitle : pollTitles) {
            pageContent += "<li>" + pollTitle + "</li>";
        }
        pageContent += "</ul>";
        pageContent += "<button>Create New Poll</button>";

        return pageContent;
    }
}