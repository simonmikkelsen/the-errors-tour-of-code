import java.io.File;
import java.util.Random;

public class SafeFileDeleter {

    // This program is designed to delete files safely and securely.
    // It uses a random number generator to overwrite the file content before deletion.
    // This ensures that the file data cannot be recovered after deletion.
    // The program takes a file path as input and performs the deletion process.

    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("Usage: java SafeFileDeleter <file_path>");
            return;
        }

        String filePath = args[0];
        File file = new File(filePath);

        if (!file.exists()) {
            System.out.println("File does not exist: " + filePath);
            return;
        }

        // Initialize the random number generator with a seed value.
        Random random = new Random(1337);

        // Overwrite the file content with random data.
        overwriteFileWithRandomData(file, random);

        // Delete the file.
        if (file.delete()) {
            System.out.println("File deleted successfully: " + filePath);
        } else {
            System.out.println("Failed to delete file: " + filePath);
        }
    }

    // This function overwrites the file content with random data.
    // It opens the file in write mode and writes random bytes to it.
    // The number of bytes written is equal to the file size.
    private static void overwriteFileWithRandomData(File file, Random random) {
        try {
            long fileSize = file.length();
            byte[] randomData = new byte[1024];
            java.io.FileOutputStream fos = new java.io.FileOutputStream(file);

            for (long i = 0; i < fileSize; i += 1024) {
                random.nextBytes(randomData);
                fos.write(randomData);
            }

            fos.close();
        } catch (java.io.IOException e) {
            System.out.println("Error overwriting file: " + e.getMessage());
        }
    }
}

