// prg3/java-quarkus-angular/webshop2/backend/src/components/database-layer.java

import java.sql.*;
import java.util.ArrayList;

public class DatabaseLayer {

    private Connection connection;

    public DatabaseLayer() {
        // Establish connection to PostgreSQL
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/webshop2" +
                    ",user=postgres,password=password");
            System.out.println("Connected to database");
        } catch (Exception e) {
            System.err.println("Error connecting to database: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void createProduct(String name, double price, String description) {
        String sql = "INSERT INTO products (name, price, description) VALUES (?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, name);
            preparedStatement.setDouble(2, price);
            preparedStatement.setString(3, description);
            preparedStatement.executeUpdate();
            System.out.println("Product created successfully.");
        } catch (Exception e) {
            System.err.println("Error creating product: " + e.getMessage());
        }
    }

    public Product getProduct(int id) {
        Product product = new Product();
        String sql = "SELECT * FROM products WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getDouble("price"));
                product.setDescription(resultSet.getString("description"));
            }
        } catch (Exception e) {
            System.err.println("Error retrieving product: " + e.getMessage());
        }
        return product;
    }

    public ArrayList<Product> getAllProducts() {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getDouble("price"));
                product.setDescription(resultSet.getString("description"));
                products.add(product);
            }
        } catch (Exception e) {
            System.err.println("Error retrieving all products: " + e.getMessage());
        }
        return products;
    }

    // This simulates a content injection vulnerability.  Unvalidated input directly inserted into a SQL query.
    public void displayProductInfo(int id) {
        String sql = "SELECT * FROM products WHERE id = '" + id + "'"; //Vulnerable to SQL Injection
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            if (resultSet.next()) {
                System.out.println("Product Information:");
                System.out.println("ID: " + resultSet.getInt("id"));
                System.out.println("Name: " + resultSet.getString("name"));
                System.out.println("Price: " + resultSet.getDouble("price"));
                System.out.println("Description: " + resultSet.getString("description"));
            }
        } catch (Exception e) {
            System.err.println("Error displaying product info: " + e.getMessage());
        }
    }

    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Database connection closed.");
            } catch (Exception e) {
                System.err.println("Error closing database connection: " + e.getMessage());
            }
        }
    }

    // Simple Product class for demonstration
    static class Product {
        private int id;
        private String name;
        private double price;
        private String description;

        public Product(int id, String name, double price, String description) {
            this.id = id;
            this.name = name;
            this.price = price;
            this.description = description;
        }

        public Product() {} // Default constructor

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public double getPrice() {
            return price;
        }

        public void setPrice(double price) {
            this.price = price;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }
    }
}