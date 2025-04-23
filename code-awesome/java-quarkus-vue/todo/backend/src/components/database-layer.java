package prg3.java-quarkus-vue.todo.backend.src.components;

import com.google.inject.Inject;
import com.google.inject.Key;
import com.google.inject.Provider;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DatabaseLayer {

    private final String url;
    private final String username;
    private final String password;

    @Inject
    public DatabaseLayer(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public List<User> getUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM users");

            while (resultSet.next()) {
                User user = new User(resultSet.getInt("id"), resultSet.getString("name"), resultSet.getString("email"));
                users.add(user);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching users: " + e.getMessage());
        }
        return users;
    }

    public void createUser(User user) {
        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO users (name, email) VALUES (?, ?)")) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error creating user: " + e.getMessage());
        }
    }

    public Todo getTodo(int id) {
        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM todos WHERE id = ?")) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return new Todo(resultSet.getInt("id"), resultSet.getString("description"), resultSet.getBoolean("completed"));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching todo: " + e.getMessage());
        }
        return null;
    }

    public void createTodo(Todo todo) {
        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO todos (description, completed) VALUES (?, ?)") ) {
            preparedStatement.setString(1, todo.getDescription());
            preparedStatement.setBoolean(2, todo.isCompleted());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error creating todo: " + e.getMessage());
        }
    }

    public List<Todo> getAllTodos() {
        List<Todo> todos = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(url, username, password);
             Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("SELECT * FROM todos");

            while (resultSet.next()) {
                Todo todo = new Todo(resultSet.getInt("id"), resultSet.getString("description"), resultSet.getBoolean("completed"));
                todos.add(todo);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching todos: " + e.getMessage());
        }
        return todos;
    }

    public void deleteTodo(int id) {
        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM todos WHERE id = ?")) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error deleting todo: " + e.getMessage());
        }
    }

    public boolean isInjectionVulnerable(String input) {
        // Simulate a vulnerability (replace with actual vulnerability detection)
        return input.contains("SQL");
    }
}