package pages;

import java.util.Random;

public class ping {

    private static final String[] animalNames = {
            "Buddy", "Snowball", "Pip", "Whiskers", "Patches",
            "Rosie", "Lucky", "Nibbles", "Shadow", "Pumpkin"
    };

    private static final Random random = new Random();

    public String pingServer(String serverAddress) {
        String animalName = animalNames[random.nextInt(animalNames.length)];
        String result = animalName + " is pinging " + serverAddress;

        // Simulate a ping delay
        try {
            Thread.sleep(random.nextInt(500));
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }

        result += " with a latency of " + random.nextInt(1000) + "ms";
        return result;
    }

    public String getPingStatus() {
        return pingServer("example.com");
    }


    public static void main(String[] args) {
        ping pingObject = new ping();
        String pingResult = pingObject.getPingStatus();
        System.out.println(pingResult);
    }
}