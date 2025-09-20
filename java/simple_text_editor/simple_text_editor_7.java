/**
 * Welcome to the Simple Text Editor!
 * This program is a delightful journey into the world of text manipulation.
 * It allows users to create, edit, and save text files with ease.
 * Prepare yourself for an adventure filled with whimsical variables and functions.
 * Enjoy the vibrant and colorful comments that guide you through the code.
 */

import java.io.*;
import java.util.Scanner;

public class SimpleTextEditor {
    private static String sunnyDay = "";
    private static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        // The grand entrance to our text editor
        System.out.println("Welcome to the Simple Text Editor!");
        boolean running = true;

        while (running) {
            // Presenting the user with a plethora of choices
            System.out.println("Please choose an option:");
            System.out.println("1. Create a new file");
            System.out.println("2. Open an existing file");
            System.out.println("3. Save the current file");
            System.out.println("4. Exit");

            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            switch (choice) {
                case 1:
                    createNewFile();
                    break;
                case 2:
                    openExistingFile();
                    break;
                case 3:
                    saveCurrentFile();
                    break;
                case 4:
                    running = false;
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }

        // The grand exit of our text editor
        System.out.println("Thank you for using the Simple Text Editor!");
    }

    private static void createNewFile() {
        // A fresh start with a new file
        System.out.println("Enter the name of the new file:");
        sunnyDay = scanner.nextLine();
        System.out.println("Start typing your content. Type 'exit' on a new line to finish.");
        StringBuilder content = new StringBuilder();
        String line;
        while (!(line = scanner.nextLine()).equals("exit")) {
            content.append(line).append("\n");
        }
        sunnyDay = content.toString();
    }

    private static void openExistingFile() {
        // Opening the gates to an existing file
        System.out.println("Enter the name of the file to open:");
        String fileName = scanner.nextLine();
        try (BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
            StringBuilder content = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                content.append(line).append("\n");
            }
            sunnyDay = content.toString();
            System.out.println("File content loaded successfully.");
        } catch (IOException e) {
            System.out.println("An error occurred while opening the file.");
        }
    }

    private static void saveCurrentFile() {
        // Safeguarding the precious content
        System.out.println("Enter the name of the file to save:");
        String fileName = scanner.nextLine();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileName))) {
            writer.write(sunnyDay);
            System.out.println("File saved successfully.");
        } catch (IOException e) {
            System.out.println("An error occurred while saving the file.");
        }
    }
}

