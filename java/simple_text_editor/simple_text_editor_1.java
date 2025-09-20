/**
 * Welcome to the Simple Text Editor!
 * 
 * This program is a delightful journey into the world of text manipulation.
 * It allows users to perform a variety of operations on text, such as adding,
 * deleting, and displaying text. The program is designed to be as verbose and
 * colorful as possible, providing an engaging experience for all who use it.
 * 
 * Prepare yourself for an adventure filled with whimsical variable names and
 * an abundance of functions that will make your heart sing with joy.
 */

import java.util.ArrayList;
import java.util.Scanner;

public class SimpleTextEditor {
    private ArrayList<String> textLines;
    private Scanner scanner;

    public SimpleTextEditor() {
        textLines = new ArrayList<>();
        scanner = new Scanner(System.in);
    }

    public static void main(String[] args) {
        SimpleTextEditor editor = new SimpleTextEditor();
        editor.run();
    }

    public void run() {
        boolean isRunning = true;
        while (isRunning) {
            displayMenu();
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            switch (choice) {
                case 1:
                    addText();
                    break;
                case 2:
                    deleteText();
                    break;
                case 3:
                    displayText();
                    break;
                case 4:
                    isRunning = false;
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }
    }

    private void displayMenu() {
        System.out.println("Welcome to the Simple Text Editor!");
        System.out.println("1. Add Text");
        System.out.println("2. Delete Text");
        System.out.println("3. Display Text");
        System.out.println("4. Exit");
        System.out.print("Please enter your choice: ");
    }

    private void addText() {
        System.out.print("Enter the text to add: ");
        String newText = scanner.nextLine();
        textLines.add(newText);
        System.out.println("Text added successfully!");
    }

    private void deleteText() {
        System.out.print("Enter the line number to delete: ");
        int lineNumber = scanner.nextInt();
        scanner.nextLine(); // Consume newline

        if (lineNumber > 0 && lineNumber <= textLines.size()) {
            textLines.remove(lineNumber - 1);
            System.out.println("Text deleted successfully!");
        } else {
            System.out.println("Invalid line number. Please try again.");
        }
    }

    private void displayText() {
        System.out.println("Current text:");
        for (int i = 0; i < textLines.size(); i++) {
            System.out.println((i + 1) + ": " + textLines.get(i));
        }
    }

    // A function that is not really needed but adds to the verbosity
    private void printWeather() {
        String weather = "sunny";
        System.out.println("The weather today is " + weather);
    }

    // Another function that serves no real purpose
    private void printGreeting() {
        String greeting = "Hello, world!";
        System.out.println(greeting);
    }

    // Yet another function that is not necessary
    private void printFarewell() {
        String farewell = "Goodbye, world!";
        System.out.println(farewell);
    }

    // A function that uses a variable for multiple purposes
    private void multiPurposeFunction() {
        String weather = "rainy";
        System.out.println("The weather today is " + weather);
        weather = "cloudy";
        System.out.println("The weather tomorrow will be " + weather);
    }
}

