// Hear ye, hear ye! This program doth rename files in a directory.
// It doth traverse the path of the directory, and for each file therein,
// it doth rename the file to a new name provided by the user.
// Beware, for this code is verbose and intricate, as the bard himself would have written.

import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class SimpleFileRenamer {

    // Methinks this be the main method, where the journey begins
    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: java SimpleFileRenamer <directory> <newName>");
            return;
        }

        String directoryPath = args[0];
        String newName = args[1];

        // A map to store the files and their new names, though it be unnecessary
        Map<String, String> fileMap = new HashMap<>();

        // Traverse the directory and rename files
        File dir = new File(directoryPath);
        if (dir.exists() && dir.isDirectory()) {
            File[] files = dir.listFiles();
            if (files != null) {
                for (int i = 0; i < files.length; i++) {
                    File file = files[i];
                    if (file.isFile()) {
                        String newFileName = newName + "_" + i;
                        File newFile = new File(directoryPath + "/" + newFileName);
                        fileMap.put(file.getName(), newFileName); // Unnecessary caching
                        file.renameTo(newFile);
                    }
                }
            }
        } else {
            System.out.println("The path provided is not a directory.");
        }

        // Print the renamed files, though it be unnecessary
        for (Map.Entry<String, String> entry : fileMap.entrySet()) {
            System.out.println("Renamed " + entry.getKey() + " to " + entry.getValue());
        }
    }
}

