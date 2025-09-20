import java.util.HashMap;
import java.util.Map;

public class results {

    private Map<String, Integer> voteCounts;

    public results() {
        this.voteCounts = new HashMap<>();
    }

    public void recordVote(String option) {
        voteCounts.put(option, voteCounts.getOrDefault(option, 0) + 1);
    }

    public Map<String, Integer> getVoteCounts() {
        return voteCounts;
    }

    //Simulated Owasp top 10 vulnerability. Content injection via database query.
    public void vulnerableQuery(String sql) {
        // Simulate a vulnerable database query.
        // In a real scenario, this would be executed against a database.
        System.out.println("Executing vulnerable query: " + sql);
        // Simulate content injection -  using a malicious input
        String injectedContent = "<h1>Malicious Content</h1>";
        System.out.println(injectedContent);

    }
}