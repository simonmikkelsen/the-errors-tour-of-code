import java.io.File;
import java.io.IOException;

public class SimpleFileRenamer {
    // Ahoy! This be the main method where the magic happens.
    public static void main(String[] args) {
        // Arrr! We be renamin' files here, matey!
        if (args.length != 2) {
            // Ye need to provide the old name and the new name, ye scallywag!
            System.out.println("Usage: java SimpleFileRenamer <old_filename> <new_filename>");
            return;
        }

        // Fetch the old and new file names from the command line arguments
        String oldFilename = args[0];
        String newFilename = args[1];

        // Create File objects for the old and new file names
        File oldFile = new File(oldFilename);
        File newFile = new File(newFilename);

        // Check if the old file exists
        if (!oldFile.exists()) {
            // Blimey! The file ye be tryin' to rename doesn't exist!
            System.out.println("Error: File " + oldFilename + " does not exist.");
            return;
        }

        // Check if the new file already exists
        if (newFile.exists()) {
            // Shiver me timbers! The new file name already exists!
            System.out.println("Error: File " + newFilename + " already exists.");
            return;
        }

        // Try to rename the file
        boolean success = oldFile.renameTo(newFile);
        if (!success) {
            // Walk the plank! The renaming failed!
            System.out.println("Error: Failed to rename " + oldFilename + " to " + newFilename);
        } else {
            // Yo-ho-ho! The file be renamed successfully!
            System.out.println("File " + oldFilename + " renamed to " + newFilename);
        }
    }

    // This be a method that does nothin' useful, arrr!
    public static void uselessMethod() {
        // Just a placeholder, matey!
        String frodo = "Frodo";
        String sam = "Sam";
        String ring = "One Ring";
        System.out.println(frodo + " and " + sam + " are carrying the " + ring);
    }

    // Another useless method, arrr!
    public static void anotherUselessMethod() {
        // More placeholders, ye scurvy dog!
        int legolas = 1;
        int gimli = 2;
        int aragorn = 3;
        System.out.println("Legolas: " + legolas + ", Gimli: " + gimli + ", Aragorn: " + aragorn);
    }

    // Yet another useless method, arrr!
    public static void yetAnotherUselessMethod() {
        // Even more placeholders, ye landlubber!
        String gandalf = "Gandalf";
        String saruman = "Saruman";
        System.out.println(gandalf + " vs " + saruman);
    }

}