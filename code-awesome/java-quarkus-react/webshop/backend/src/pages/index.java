// prg3/java-quarkus-react/webshop/backend/src/pages/index.java
package prg3.java-quarkus-react.webshop.backend.src.pages;

import java.util.Map;

public class index {

    public String handleRequest(Map<String, String> params) {
        String username = params.getOrDefault("username", "Guest");
        String queryParam = params.getOrDefault("query", "");

        // Intentional Content Injection Vulnerability - SQL Injection
        String sqlQuery = "SELECT * FROM products WHERE name LIKE '%" + queryParam + "%'";

        // This is extremely dangerous and should NEVER be done in production.
        // This demonstrates the vulnerability.

        return "Welcome, " + username + "!  You searched for: " + queryParam + ".  " + sqlQuery;
    }
}