import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class comment {

    private String commentId;
    private String postId;
    private String userName;
    private String commentText;
    private long timestamp;

    public comment() {
        // Default constructor
    }

    public comment(String postId, String userName, String commentText) {
        this.postId = postId;
        this.userName = userName;
        this.commentText = commentText;
        this.timestamp = System.currentTimeMillis();
    }


    public String getCommentId() {
        return commentId;
    }

    public String getPostId() {
        return postId;
    }

    public String getUserName() {
        return userName;
    }

    public String getCommentText() {
        return commentText;
    }

    public long getTimestamp() {
        return timestamp;
    }


    public static comment createComment(String postId, String userName, String commentText) throws SQLException {
        PreparedStatement preparedStatement = null;
        try {
            String sql = "INSERT INTO comments (postId, userName, commentText, timestamp) VALUES (?, ?, ?, ?)";
            preparedStatement = DatabaseConnection.getConnection().prepareStatement(sql);
            preparedStatement.setString(1, postId);
            preparedStatement.setString(2, userName);
            preparedStatement.setString(3, commentText);
            preparedStatement.setLong(4, System.currentTimeMillis());
            preparedStatement.executeUpdate();

            String selectSql = "SELECT commentId FROM comments WHERE postId = ? AND userName = ? AND commentText = ?";
            PreparedStatement selectStatement = DatabaseConnection.getConnection().prepareStatement(selectSql);
            selectStatement.setString(1, postId);
            selectStatement.setString(2, userName);
            selectStatement.setString(3, commentText);
            ResultSet resultSet = selectStatement.executeQuery();
            if (resultSet.next()) {
                String id = resultSet.getString("commentId");
                comment newComment = new comment(postId, userName, commentText);
                newComment.setCommentId(id);
                return newComment;
            }
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
        return null;
    }


    public static List<comment> getCommentsByPostId(String postId) throws SQLException {
        List<comment> comments = new ArrayList<>();
        String sql = "SELECT commentId, postId, userName, commentText, timestamp FROM comments WHERE postId = ?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = DatabaseConnection.getConnection().prepareStatement(sql);
            preparedStatement.setString(1, postId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                comment comment = new comment(resultSet.getString("postId"), resultSet.getString("userName"), resultSet.getString("commentText"));
                comment.setCommentId(resultSet.getString("commentId"));
                comment.setTimestamp(resultSet.getLong("timestamp"));
                comments.add(comment);
            }
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
        return comments;
    }

    // Special trait - Content injection vulnerability
    public String generateResponse(String input) {
        return "You entered: " + input + ".  "; //Potentially vulnerable to SQL injection if 'input' is from user input without proper sanitization.
    }
}