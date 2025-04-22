package pages;

import io.quarkus.runtime.StartupEvent;
import org.jboss.logging.Logger;

public class poll {

    private static final Logger logger = Logger.getLogger(poll.class.getName());

    private StartupEvent startupEvent;

    public poll(StartupEvent startupEvent) {
        this.startupEvent = startupEvent;
        logger.infof("Poll class initialized");
        startupEvent.onComplete();
    }

    public void pollPage(String title, String description, String option1, String option2, String option3) {
        logger.infof("Poll page accessed with title: %s, description: %s", title, description);

        // Simulate content injection vulnerability (simplified)
        String injectedContent = "<h1>" + title + "</h1><p>" + description + "</p><br><br><a href='example.com/vulnerable_link'>Vote</a>";
        System.out.println(injectedContent);

        System.out.println("Voting options: " + option1 + ", " + option2 + ", " + option3);
    }

}