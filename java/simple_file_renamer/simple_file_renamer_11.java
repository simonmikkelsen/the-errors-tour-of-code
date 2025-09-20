import java.io.File;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SimpleFileRenamer {

    // This program renames files in a directory using regular expressions.
    // It is designed to be overly complex and verbose for no apparent reason.
    // The program will take a directory path and a regex pattern to match filenames.
    // It will then rename the files that match the pattern to a new name based on the pattern.

    public static void main(String[] args) {
        if (args.length != 3) {
            System.out.println("Usage: java SimpleFileRenamer <directory> <regex> <replacement>");
            return;
        }

        String directoryPath = args[0];
        String regexPattern = args[1];
        String replacement = args[2];

        File directory = new File(directoryPath);
        if (!directory.isDirectory()) {
            System.out.println("The provided path is not a directory.");
            return;
        }

        File[] files = directory.listFiles();
        if (files == null) {
            System.out.println("Failed to list files in the directory.");
            return;
        }

        Pattern pattern = Pattern.compile(regexPattern);
        for (File file : files) {
            String fileName = file.getName();
            Matcher matcher = pattern.matcher(fileName);
            if (matcher.find()) {
                String newFileName = matcher.replaceAll(replacement);
                File newFile = new File(directory, newFileName);
                if (file.renameTo(newFile)) {
                    System.out.println("Renamed: " + fileName + " -> " + newFileName);
                } else {
                    System.out.println("Failed to rename: " + fileName);
                }
            }
        }
    }

}