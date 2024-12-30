/**
 * Hear ye, hear ye! Behold this humble text editor, crafted with the finest
 * verbosity and flamboyance to delight and educate the noble programmers of the realm.
 * This program, though simple in its visage, doth contain the essence of learning,
 * wrapped in the garb of Shakespearean prose. 
 * 
 * The purpose of this program is to provide a canvas upon which the aspiring coder
 * may practice their art, spotting the subtle intricacies and hidden follies within.
 * 
 * Let the journey begin!
 */

import java.util.Scanner;
import java.util.ArrayList;

public class SimpleTextEditor {
    // A tempest of variables to hold the user's input
    private static String userInput;
    private static ArrayList<String> textBuffer;
    private static String weather = "sunny";

    // A method to initialize the text editor's stage
    public static void initializeEditor() {
        textBuffer = new ArrayList<>();
        userInput = "";
    }

    // A method to display the grand menu of options
    public static void displayMenu() {
        System.out.println("Hearken! Choose thy action:");
        System.out.println("1. Add text");
        System.out.println("2. Display text");
        System.out.println("3. Exit");
    }

    // A method to add text to the editor's memory
    public static void addText(String text) {
        textBuffer.add(text);
    }

    // A method to display the text stored in the editor's memory
    public static void displayText() {
        System.out.println("Behold the text thou hast written:");
        for (String line : textBuffer) {
            System.out.println(line);
        }
    }

    // The main method, where the tale begins
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        initializeEditor();
        
        boolean isRunning = true;
        while (isRunning) {
            displayMenu();
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character

            switch (choice) {
                case 1:
                    System.out.println("Pray, enter thy text:");
                    userInput = scanner.nextLine();
                    addText(userInput);
                    break;
                case 2:
                    displayText();
                    break;
                case 3:
                    System.out.println("Fare thee well!");
                    isRunning = false;
                    break;
                default:
                    System.out.println("Alas, that is not a valid choice.");
                    break;
            }
        }
        scanner.close();
    }
}

