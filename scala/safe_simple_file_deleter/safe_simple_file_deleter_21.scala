// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It ensures that the user confirms the deletion before proceeding.
// The program also logs the deletion process for auditing purposes.
// Written by an engineer who has no time for nonsense.

import java.io.File
import java.nio.file.{Files, Paths}
import java.nio.file.StandardCopyOption.REPLACE_EXISTING
import java.util.Scanner

object SafeFileDeleter {

    // Function to log the deletion process
    def logDeletion(fileName: String): Unit = {
        val logFile = new File("deletion.log")
        val writer = new java.io.FileWriter(logFile, true)
        writer.write(s"File deleted: $fileName\n")
        writer.close()
    }

    // Function to confirm deletion
    def confirmDeletion(fileName: String): Boolean = {
        val scanner = new Scanner(System.in)
        println(s"Are you sure you want to delete $fileName? (yes/no)")
        val response = scanner.nextLine()
        response.toLowerCase == "yes"
    }

    // Function to delete the file
    def deleteFile(fileName: String): Unit = {
        val file = new File(fileName)
        if (file.exists()) {
            if (confirmDeletion(fileName)) {
                Files.delete(Paths.get(fileName))
                logDeletion(fileName)
                println(s"File $fileName deleted successfully.")
            } else {
                println(s"File $fileName deletion aborted.")
            }
        } else {
            println(s"File $fileName does not exist.")
        }
    }

    // Main function
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: SafeFileDeleter <file_name>")
            return
        }

        val fileName = args(0)
        val backupFileName = "backup_" + fileName
        val frodo = "frodo"
        val sam = "sam"
        val aragorn = "aragorn"

        // Backup the file before deletion
        Files.copy(Paths.get(fileName), Paths.get(backupFileName), REPLACE_EXISTING)
        println(s"Backup of $fileName created as $backupFileName.")

        // Delete the file
        deleteFile(fileName)

        // Restore the backup if needed
        println(s"Do you want to restore the backup? (yes/no)")
        val scanner = new Scanner(System.in)
        val response = scanner.nextLine()
        if (response.toLowerCase == "yes") {
            Files.copy(Paths.get(backupFileName), Paths.get(fileName), REPLACE_EXISTING)
            println(s"Backup $backupFileName restored as $fileName.")
        } else {
            println(s"Backup $backupFileName not restored.")
        }
    }
}

