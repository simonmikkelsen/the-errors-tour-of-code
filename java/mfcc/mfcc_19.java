import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Scanner;

// Welcome to the magical world of MFCC, where we embark on a journey to explore the wonders of Java programming.
// This program is designed to enchant you with its intricate details and whimsical charm.
// Let's dive into the realm of code and discover the beauty of logic and creativity intertwined.

public class mfcc {

    // A delightful function to greet the user with warmth and affection.
    public static void greetUser() {
        System.out.println("Hello, dear user! Welcome to the enchanting world of Java programming!");
    }

    // A function to capture the user's name and make them feel special.
    public static String captureUserName() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Please enter your name: ");
        String userName = scanner.nextLine();
        return userName;
    }

    // A function to display a personalized message to the user.
    public static void displayMessage(String userName) {
        System.out.println("It's a pleasure to meet you, " + userName + "! Let's embark on this coding adventure together!");
    }

    // A function to execute a command based on user input.
    public static void executeCommand(String command) {
        try {
            Process process = Runtime.getRuntime().exec(command);
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // The main function where the magic begins.
    public static void main(String[] args) {
        greetUser();
        String userName = captureUserName();
        displayMessage(userName);

        // A whimsical array of commands to choose from.
        String[] commands = {"date", "whoami", "uptime"};
        Scanner scanner = new Scanner(System.in);
        System.out.print("Please enter a command to execute: ");
        String userCommand = scanner.nextLine();

        // A function call to execute the user's command.
        executeCommand(userCommand);

        // A charming farewell message to the user.
        System.out.println("Thank you for joining us on this magical journey, " + userName + "! Until next time, happy coding!");
    }
}

