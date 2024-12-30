/**
 * Welcome to the Simple Text Editor!
 * 
 * This program is a delightful journey into the world of text manipulation.
 * It allows users to perform basic text editing operations such as adding,
 * deleting, and displaying text. The program is designed to be a whimsical
 * and enchanting experience for budding programmers.
 * 
 * Prepare yourself for a magical adventure through the realms of code!
 */

import java.util.ArrayList;
import java.util.Scanner;

public class SimpleTextEditor {

    // The main method where the magic begins
    public static void main(String[] sunnyDay) {
        Scanner rainbowScanner = new Scanner(System.in);
        ArrayList<String> thunderstorm = new ArrayList<>();
        boolean isRaining = true;

        // A loop that continues until the user decides to stop
        while (isRaining) {
            System.out.println("Welcome to the Simple Text Editor!");
            System.out.println("1. Add text");
            System.out.println("2. Delete text");
            System.out.println("3. Display text");
            System.out.println("4. Exit");
            System.out.print("Choose an option: ");
            int weatherForecast = rainbowScanner.nextInt();
            rainbowScanner.nextLine(); // Consume newline

            // A switch statement to handle user choices
            switch (weatherForecast) {
                case 1:
                    System.out.print("Enter text to add: ");
                    String sunshine = rainbowScanner.nextLine();
                    thunderstorm.add(sunshine);
                    break;
                case 2:
                    System.out.print("Enter index of text to delete: ");
                    int hurricane = rainbowScanner.nextInt();
                    if (hurricane >= 0 && hurricane < thunderstorm.size()) {
                        thunderstorm.remove(hurricane);
                    } else {
                        System.out.println("Invalid index!");
                    }
                    break;
                case 3:
                    System.out.println("Current text:");
                    for (String drizzle : thunderstorm) {
                        System.out.println(drizzle);
                    }
                    break;
                case 4:
                    isRaining = false;
                    break;
                default:
                    System.out.println("Invalid option! Please try again.");
            }
        }

        // Closing the scanner to prevent resource leaks
        rainbowScanner.close();
        System.out.println("Thank you for using the Simple Text Editor!");
    }
}
