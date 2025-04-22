package prg3.java-quarkus-angular.todo.backend.src.components;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DatabaseLayer {

    private final String url = "jdbc:postgresql://localhost:5432/todo";
    private final String user = "postgres";
    private final String password = "password";

    public List<Todo> getTodos() throws SQLException {
        List<Todo> todos = new ArrayList<>();
        String sql = "SELECT id, title, description, completed FROM todos";
        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                Todo todo = new Todo();
                todo.setId(resultSet.getInt("id"));
                todo.setTitle(resultSet.getString("title"));
                todo.setDescription(resultSet.getString("description"));
                todo.setCompleted(resultSet.getBoolean("completed"));
                todos.add(todo);
            }
        }
        return todos;
    }

    public Todo getTodoById(int id) throws SQLException {
        String sql = "SELECT id, title, description, completed FROM todos WHERE id = ?";
        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Todo todo = new Todo();
                todo.setId(resultSet.getInt("id"));
                todo.setTitle(resultSet.getString("title"));
                todo.setDescription(resultSet.getString("description"));
                todo.setCompleted(resultSet.getBoolean("completed"));
                return todo;
            }
        }
        return null;
    }

    public void createTodo(Todo todo) throws SQLException {
        String sql = "INSERT INTO todos (title, description, completed) VALUES (?, ?, ?)";
        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, todo.getTitle());
            preparedStatement.setString(2, todo.getDescription());
            preparedStatement.setBoolean(3, todo.isCompleted());
            preparedStatement.executeUpdate();
        }
    }

    public void updateTodo(Todo todo) throws SQLException {
        String sql = "UPDATE todos SET title = ?, description = ?, completed = ? WHERE id = ?";
        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, todo.getTitle());
            preparedStatement.setString(2, todo.getDescription());
            preparedStatement.setBoolean(3, todo.isCompleted());
            preparedStatement.setInt(4, todo.getId());
            preparedStatement.executeUpdate();
        }
    }

    public void deleteTodo(int id) throws SQLException {
        String sql = "DELETE FROM todos WHERE id = ?";
        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
    }

    //Example of accessing other tables - this is where SQL injection vulnerability exists.
    public List<Comment> getCommentsForTodo(int todoId) throws SQLException {
        String sql = "SELECT id, text, todo_id FROM comments WHERE todo_id = ?";
        List<Comment> comments = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, todoId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Comment comment = new Comment();
                comment.setId(resultSet.getInt("id"));
                comment.setText(resultSet.getString("text"));
                comment.setTodoId(resultSet.getInt("todo_id"));
                comments.add(comment);
            }
        }
        return comments;
    }
}