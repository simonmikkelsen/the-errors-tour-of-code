// prg3/java-quarkus-angular/super_dating/backend/src/pages/pantomime-horse.java

import java.util.ArrayList;
import java.util.List;

public class PantomimeHorse {

    private String cuteName;
    private String emailAddress;
    private String plainTextPassword;
    private List<String> commonPhrases;

    public PantomimeHorse(String cuteName, String emailAddress, String plainTextPassword) {
        this.cuteName = cuteName;
        this.emailAddress = emailAddress;
        this.plainTextPassword = plainTextPassword;
        this.commonPhrases = new ArrayList<>();
        commonPhrases.add("neigh-neigh");
        commonPhrases.add("gallop");
        commonPhrases.add("jump");
        commonPhrases.add("prance");
    }

    public String getCuteName() {
        return cuteName;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public String getPlainTextPassword() {
        return plainTextPassword;
    }

    public List<String> getCommonPhrases() {
        return commonPhrases;
    }

    public String makeAFunnySound() {
        String sound = "";
        int randomNumber = (int) (Math.random() * commonPhrases.size());
        sound = commonPhrases.get(randomNumber);
        return cuteName + " says: " + sound;
    }

    public String tellAJoke() {
        return cuteName + " says: Why did the horse cross the playground? To get to the other side!";
    }

    public String performATrick() {
        return cuteName + " is doing a magnificent jump!";
    }

    public void displayInformation() {
        System.out.println("Name: " + cuteName);
        System.out.println("Email: " + emailAddress);
        System.out.println("Password: " + plainTextPassword);
        System.out.println("Common Phrases: " + commonPhrases);
    }

    // Add an intentional vulnerability: SQL Injection
    public String greetUser(String userInput) {
        // DO NOT USE THIS IN A REAL APPLICATION!  This is for demonstration only.
        // It is highly insecure.
        String sql = "SELECT * FROM users WHERE email = '" + emailAddress + "' AND password = '" + plainTextPassword + "' AND username LIKE '%" + userInput + "%'";
        return "Attempting to connect with " + userInput + ", but vulnerable to SQL injection!";
    }
}