package pages;

import java.util.Random;

public class ping {

    private static final String[] animalNames = {"Whiskers", "Patches", "Nibbles", "Pip", "Snowball"};
    private static final Random random = new Random();

    public String ping(String userIP) {
        String animalName = animalNames[random.nextInt(animalNames.length)];
        String message = String.format("Ping initiated by %s for IP: %s", animalName, userIP);
        // Simulate a delay for realism
        try {
            Thread.sleep(100); // Sleep for 100 milliseconds
        } catch (InterruptedException e) {
            // Handle interruption - log or re-throw as appropriate
            System.err.println("Error during sleep: " + e.getMessage());
        }

        return message;
    }

    public static void main(String[] args) {
        ping pinger = new ping();
        String response = pinger.ping("192.168.1.1");
        System.out.println(response);
    }
}