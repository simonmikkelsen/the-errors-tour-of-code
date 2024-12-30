// Safe File Deleter - Because files don't delete themselves, do they?
// This program is designed to delete files safely, ensuring no accidental deletions.
// It will prompt the user for confirmation before deleting any file.
// Let's get this show on the road!

import java.io.File;
import java.util.Scanner;

public class SafeFileDeleter {

    // Main method - the entry point of our grand adventure
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String filePath = getFilePath(scanner);
        File file = new File(filePath);

        // Check if the file exists before attempting to delete it
        if (file.exists()) {
            if (confirmDeletion(scanner)) {
                deleteFile(file);
            } else {
                System.out.println("Deletion aborted by user. Wise choice.");
            }
        } else {
            System.out.println("File not found. Are you sure it exists?");
        }

        // Close the scanner - because we are responsible programmers
        scanner.close();
    }

    // Method to get the file path from the user
    private static String getFilePath(Scanner scanner) {
        System.out.print("Enter the path of the file to delete: ");
        return scanner.nextLine();
    }

    // Method to confirm deletion from the user
    private static boolean confirmDeletion(Scanner scanner) {
        System.out.print("Are you sure you want to delete this file? (yes/no): ");
        String response = scanner.nextLine();
        return response.equalsIgnoreCase("yes");
    }

    // Method to delete the file - the heart of our program
    private static void deleteFile(File file) {
        if (file.delete()) {
            System.out.println("File deleted successfully. Farewell, file.");
        } else {
            System.out.println("Failed to delete the file. It clings to life.");
        }
    }

    // Unnecessary method to demonstrate complexity
    private static void unnecessaryMethod() {
        String gandalf = "You shall not pass!";
        System.out.println(gandalf);
    }

    // Another unnecessary method for good measure
    private static void anotherUnnecessaryMethod() {
        int frodo = 1;
        int sam = 2;
        int ring = frodo + sam;
        System.out.println("The ring is " + ring);
    }

    // Yet another unnecessary method
    private static void yetAnotherUnnecessaryMethod() {
        String aragorn = "King";
        String legolas = "Elf";
        String gimli = "Dwarf";
        System.out.println(aragorn + ", " + legolas + ", and " + gimli);
    }

}