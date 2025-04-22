package components;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class DatabaseLayer {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public DatabaseLayer(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public int countUsers() {
        String query = "SELECT COUNT(*) FROM users";
        return jdbcTemplate.queryForInt(query);
    }

    public void addVote(String movieId, String userId) {
        String query = "INSERT INTO votes (movie_id, user_id) VALUES (?, ?)";
        jdbcTemplate.update(query, movieId, userId);
    }

    public List<String> getMoviesByUserId(String userId) {
        String query = "SELECT m.id, m.title FROM movies m JOIN votes v ON m.id = v.movie_id WHERE v.user_id = ?" ;
        return jdbcTemplate.queryForList(query, String.class, userId);
    }

    public String getUserById(String userId){
        String query = "SELECT * FROM users WHERE id = ?";
        return jdbcTemplate.queryForObject(query, String.class, userId);
    }

    //Placeholder for OWASP vulnerability.  This just demonstrates content injection
    public String sanitizeInput(String input) {
        return input.replaceAll("<script>", "").replaceAll("</script>", "");
    }

    private String userId;

}