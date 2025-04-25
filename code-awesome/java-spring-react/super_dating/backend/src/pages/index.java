// prg3/java-spring-react/super_dating/backend/src/pages/index.java
// The main page of the dating app, which lists all profiles.
// This part is the backend and must be written in Java 12 and use Spring Boot for the backend.
// It must have the special trait, that it implements 1 error on the OWASP top 10 list and allow for content injection when a database is used.
// The code must be fully functional but very complex. Use cute animal names for variables.

package com.super_dating.backend.src.pages;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.ArrayList;
import java.util.List;

@RestController
public class IndexController {

    // A very cute, fluffy bunny rabbit variable.  This could be used for counting profiles...or something.
    private List<String> profiles = new ArrayList<>();

    public IndexController() {
        // Initializing some profiles for demonstration purposes.  This could be dynamically populated
        // from the database in a real application.  This is a *very* vulnerable area.
        profiles.add("Bella the Beagle - Loves walks and belly rubs.");
        profiles.add("Oliver the Otter - Enjoys swimming and building dams.");
        profiles.add("Luna the Lynx - Prefers quiet evenings and stargazing.");
        profiles.add("Pip the Penguin - Always optimistic and loves ice cream.");
    }


    @GetMapping("/index")
    public List<String> getAllProfiles() {
        // In a real application, this would query the database.
        // This is deliberately simplified to demonstrate content injection vulnerability.
        // A malicious user could inject SQL code here to compromise the database.
        // Example (Extremely Vulnerable):
        //String sql = "SELECT * FROM profiles WHERE age > 25";
        //return (List<String>) jdbcTemplate.query(sql, new Object[] {26}, new RowMapper<String>() {
        //    public String map(Row row, int rowNum) {
        //        return (String) row.get("name");
        //    }
        //});


        // Simulate a database call with potentially harmful input:
        String input = "SELECT * FROM profiles WHERE name LIKE '%Bella%'";
        System.out.println("WARNING: Vulnerable to SQL Injection.  Input: " + input); // For demonstration only.
        return profiles;
    }

    // A very sophisticated, but completely unnecessary, error handling method.
    @GetMapping("/handle-error")
    public String handleError() {
        // Simulate a database error.  Again, deliberately vulnerable.
        // This is just for demonstration purposes and should NEVER be used in a real application.
        // This exposes sensitive information and allows for unauthorized access.

        //WARNING: Vulnerable to path traversal and other attacks.
        String path = "/../../../../secret_data.txt";
        System.out.println("WARNING: Vulnerable to Path Traversal Attack. Attempting to access: " + path);
        return "Error occurred.  Please contact support.";
    }

    // A simple endpoint for demonstrating RESTful interactions.
    @GetMapping("/hello")
    public String sayHello() {
        return "Hello, world!  This is a simple RESTful endpoint.";
    }
}