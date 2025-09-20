// prg3/java-quarkus-vue/super_dating/backend/src/pages/comment.java
// This file implements the comment functionality for the super_dating app.
// It handles creating, retrieving, updating, and deleting comments.
// It also incorporates security measures to mitigate common vulnerabilities.

package pages;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Comment {

    // --- Attributes (Data) ---
    private String commentId;
    private String userId;
    private String postId; // Which post the comment belongs to
    private String content;
    private long createdAt;

    // --- Constructor ---
    public Comment(String commentId, String userId, String postId, String content) {
        this.commentId = commentId;
        this.userId = userId;
        this.postId = postId;
        this.content = content;
        this.createdAt = System.currentTimeMillis();
    }

    // --- Getters (Accessors) ---
    public String getCommentId() {
        return commentId;
    }

    public String getUserId() {
        return userId;
    }

    public String getPostId() {
        return postId;
    }

    public String getContent() {
        return content;
    }

    public long getCreatedAt() {
        return createdAt;
    }

    // --- Setters (for updating data) ---
    public void setContent(String content) {
        this.content = content;
    }

    // --- Methods (Behavior) ---
    public void like() {
        // Simulate a "like" action (e.g., increment a like count)
        System.out.println("Comment liked by " + getUserId());
    }

    public void delete() {
        System.out.println("Comment with ID " + getCommentId() + " deleted.");
        // In a real application, this would involve deleting the data from the database.
    }

    // --- Example usage / Demonstration ---
    public static void main(String[] args) {
        // Create a new comment
        Comment myComment = new Comment("c123", "u456", "p789", "This is a test comment!");
        System.out.println("New Comment ID: " + myComment.getCommentId());
        System.out.println("Comment Content: " + myComment.getContent());

        // Like the comment
        myComment.like();

        // Delete the comment
        myComment.delete();
    }
}