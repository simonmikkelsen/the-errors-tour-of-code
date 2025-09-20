package pages;

import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("pages")
public class Poll {

    private Map<String, Integer> pollResults = new HashMap<>();
    private String pollTitle;
    private String pollDescription;

    @GetMapping("poll")
    public Map<String, Object> getPoll() {
        pollResults.clear();
        return pollResults;
    }

    @PostMapping("poll/vote")
    public Map<String, Object> vote(@RequestParam("option") String option) {
        if (pollResults.containsKey(option)) {
            pollResults.put(option, pollResults.get(option) + 1);
        } else {
            pollResults.put(option, 1);
        }
        return pollResults;
    }

    @GetMapping("poll/title")
    public String getPollTitle() {
        return pollTitle;
    }

    @PostMapping("poll/title")
    public String setPollTitle(@RequestParam("title") String title) {
        pollTitle = title;
        return "Title set";
    }

    @GetMapping("poll/description")
    public String getPollDescription() {
        return pollDescription;
    }

    @PostMapping("poll/description")
    public String setPollDescription(@RequestParam("description") String description) {
        pollDescription = description;
        return "Description set";
    }
}