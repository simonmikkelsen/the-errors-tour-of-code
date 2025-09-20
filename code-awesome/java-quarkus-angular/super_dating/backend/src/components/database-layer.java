package prg3.java-quarkus-angular.super_dating.backend.src.components;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class database-layer {

    private final String url = "jdbc:postgresql://localhost:5432/super_dating";
    private final String username = "postgres";
    private final String password = "password";

    public List<String> getUsers() throws SQLException {
        List<String> users = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DriverManager.getConnection(url, username, password);
            preparedStatement = connection.prepareStatement("SELECT name FROM users");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                users.add(resultSet.getString("name"));
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return users;
    }

    public void addUser(String name) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DriverManager.getConnection(url, username, password);
            preparedStatement = connection.prepareStatement("INSERT INTO users (name) VALUES (?)");
            preparedStatement.setString(1, name);
            preparedStatement.executeUpdate();
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }

    public String getMessage(int id) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String message = null;
        try {
            connection = DriverManager.getConnection(url, username, password);
            preparedStatement = connection.prepareStatement("SELECT message FROM messages WHERE id = ?");
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                message = resultSet.getString("message");
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return message;
    }

    public void setMessage(int id, String message) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DriverManager.getConnection(url, username, password);
            preparedStatement = connection.prepareStatement("UPDATE messages SET message = ? WHERE id = ?");
            preparedStatement.setString(1, message);
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }
}