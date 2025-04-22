package prg3.java-quarkus-vue.voting_app.backend.src.components;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class DatabaseLayer {

    private final String url = "jdbc:postgresql://localhost:5432/voting_app";
    private final String username = "voting_user";
    private final String password = "voting_password";

    public Map<String, Object> getVote(int voteId) {
        Map<String, Object> voteMap = new HashMap<>();
        try {
            Connection connection = DriverManager.getConnection(url, username, password);
            String sql = "SELECT * FROM votes WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql, new int[]{voteId});
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                voteMap.put("id", resultSet.getInt("id"));
                voteMap.put("user_id", resultSet.getInt("user_id"));
                voteMap.put("candidate_id", resultSet.getInt("candidate_id"));
                voteMap.put("vote_date", resultSet.getDate("vote_date"));
            }

        } catch (SQLException e) {
            System.err.println("Error retrieving vote: " + e.getMessage());
            voteMap.put("error", "Failed to retrieve vote");
        }
        return voteMap;
    }

    public void addVote(int userId, int candidateId) {
        try {
            Connection connection = DriverManager.getConnection(url, username, password);
            String sql = "INSERT INTO votes (user_id, candidate_id) VALUES (?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql, new int[]{userId, candidateId});
            preparedStatement.executeUpdate();
            System.out.println("Vote added successfully!");

        } catch (SQLException e) {
            System.err.println("Error adding vote: " + e.getMessage());
        }
    }
}