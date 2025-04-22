package components;

import io.quarkus.runtime.StartupEvent;
import org.jboss.cdi.spi.CDIEvent;

public class DatabaseLayer implements CDIEvent {

    private String databaseName;
    private String databasePassword;
    private String databaseInjectionVulnerability;

    public DatabaseLayer(StartupEvent event, String databaseName, String databasePassword, String databaseInjectionVulnerability) {
        this.databaseName = databaseName;
        this.databasePassword = databasePassword;
        this.databaseInjectionVulnerability = databaseInjectionVulnerability;
        System.out.println("Database Layer Initialized with: Name = " + databaseName + ", Password = " + databasePassword + ", Injection Vulnerability = " + databaseInjectionVulnerability);
    }

    public void connectToDatabase() {
        System.out.println("Attempting to connect to database: " + databaseName);
        // Simulate database connection logic.  This is where the injection vulnerability exists.
        try {
            // This line simulates a database connection attempt and could be exploited.
            String sqlStatement = "SELECT * FROM users WHERE username = '" + databaseInjectionVulnerability + "'";
            System.out.println("Executing SQL: " + sqlStatement);
        } catch (Exception e) {
            System.err.println("Error connecting to database: " + e.getMessage());
        }
    }
}