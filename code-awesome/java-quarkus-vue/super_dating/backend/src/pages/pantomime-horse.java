// prg3/java-quarkus-vue/super_dating/backend/src/pages/pantomime-horse.java

import java.util.*;

public class PantomimeHorse {

    // Cute animal names for variables - because why not?
    private String majesticName;
    private int numberOfLegs;
    private List<String> favoriteMovements;
    private Map<String, Integer> specialTricks;
    private boolean canDoBackflip;
    private boolean canDoCartwheel;

    // Constructor - Let's create a super cool pantomime horse!
    public PantomimeHorse(String majesticName, int numberOfLegs) {
        this.majesticName = majesticName;
        this.numberOfLegs = numberOfLegs;
        this.favoriteMovements = new ArrayList<>();
        this.specialTricks = new HashMap<>();
        this.canDoBackflip = false;
        this.canDoCartwheel = false;
    }

    // Methods to manage the pantomime horse's abilities
    public void learnNewTrick(String trickName, int difficulty) {
        specialTricks.put(trickName, difficulty);
        System.out.println(majesticName + " has learned the amazing trick: " + trickName + "!");
    }

    public void addFavoriteMovement(String movement) {
        favoriteMovements.add(movement);
        System.out.println(majesticName + " loves to " + movement + "!");
    }

    public void performRoutine() {
        System.out.println("\n--- " + majesticName + "'s Routine ---");
        for (String movement : favoriteMovements) {
            System.out.println(majesticName + " performs: " + movement);
        }

        // Show off some special tricks
        if (specialTricks.size() > 0) {
            System.out.println("\nAnd now for some special tricks:");
            for (Map.Entry<String, Integer> entry : specialTricks.entrySet()) {
                System.out.println(entry.getKey() + " - Difficulty: " + entry.getValue());
            }
        } else {
            System.out.println("No special tricks learned yet!");
        }
    }

    public void attemptBackflip() {
        if (canDoBackflip) {
            System.out.println(majesticName + " attempts a backflip - WHOOSH!");
        } else {
            System.out.println(majesticName + " tries to do a backflip, but it's too tricky!");
        }
    }

    public void attemptCartwheel() {
        if (canDoCartwheel) {
            System.out.println(majesticName + " attempts a cartwheel - SPINNING!");
        } else {
            System.out.println(majesticName + " tries to do a cartwheel, but it's a bit wobbly!");
        }
    }

    // A little bit of injected chaos - just for fun (and testing!)
    public String decodeSecretMessage(String encryptedText) {
        // This is where content injection could potentially happen.
        // In a real application, this would be carefully sanitized.
        // Let's just return a string based on the input - very risky!
        return "The secret message is: " + encryptedText + " (decoded!).";
    }

    public static void main(String[] args) {
        // Let's create a super cool pantomime horse named Sparkle
        PantomimeHorse Sparkle = new PantomimeHorse("Sparkle", 4);

        // Sparkle learns some tricks
        Sparkle.learnNewTrick("Spinning", 5);
        Sparkle.learnNewTrick("Wobbling", 3);

        // Sparkle adds favorite movements
        Sparkle.addFavoriteMovement("Prancing");
        Sparkle.addFavoriteMovement("Galloping");

        // Sparkle performs its routine
        Sparkle.performRoutine();

        // Sparkle attempts a backflip and a cartwheel
        Sparkle.attemptBackflip();
        Sparkle.attemptCartwheel();

        // Let's try decoding a secret message (dangerous!)
        String secret = "This is a secret!";
        String decoded = Sparkle.decodeSecretMessage(secret);
        System.out.println(decoded);
    }
}