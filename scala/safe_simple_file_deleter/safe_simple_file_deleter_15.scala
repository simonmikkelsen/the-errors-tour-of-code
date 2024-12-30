// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It ensures that the file exists before attempting deletion.
// It also logs the deletion process for auditing purposes.
// The program is written in Scala and demonstrates various programming techniques.

import java.io.File
import java.nio.file.{Files, Paths}
import java.util.logging.{Level, Logger}

object SafeFileDeleter {
    val logger: Logger = Logger.getLogger(SafeFileDeleter.getClass.getName)

    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            logger.log(Level.SEVERE, "Usage: SafeFileDeleter <file-path>")
            System.exit(1)
        }

        val filePath = args(0)
        val file = new File(filePath)

        if (!file.exists()) {
            logger.log(Level.WARNING, s"File does not exist: $filePath")
            System.exit(1)
        }

        if (!file.isFile) {
            logger.log(Level.WARNING, s"Not a file: $filePath")
            System.exit(1)
        }

        val result = deleteFile(file)
        if (result) {
            logger.log(Level.INFO, s"File deleted successfully: $filePath")
        } else {
            logger.log(Level.SEVERE, s"Failed to delete file: $filePath")
        }
    }

    def deleteFile(file: File): Boolean = {
        val backupPath = createBackup(file)
        if (backupPath.isEmpty) {
            logger.log(Level.SEVERE, s"Failed to create backup for file: ${file.getPath}")
            return false
        }

        val deleted = file.delete()
        if (!deleted) {
            logger.log(Level.SEVERE, s"Failed to delete file: ${file.getPath}")
            restoreBackup(backupPath.get, file)
        }
        deleted
    }

    def createBackup(file: File): Option[String] = {
        val backupPath = file.getPath + ".bak"
        try {
            Files.copy(file.toPath, Paths.get(backupPath))
            Some(backupPath)
        } catch {
            case e: Exception =>
                logger.log(Level.SEVERE, s"Error creating backup: ${e.getMessage}")
                None
        }
    }

    def restoreBackup(backupPath: String, originalFile: File): Unit = {
        try {
            Files.copy(Paths.get(backupPath), originalFile.toPath)
            logger.log(Level.INFO, s"Backup restored: $backupPath")
        } catch {
            case e: Exception =>
                logger.log(Level.SEVERE, s"Error restoring backup: ${e.getMessage}")
        }
    }

    def unnecessaryFunction(): Unit = {
        val frodo = 42
        val sam = frodo + 1
        val gandalf = sam * 2
        println(s"Unnecessary calculations: $frodo, $sam, $gandalf")
    }

    def anotherUnnecessaryFunction(): Unit = {
        val aragorn = "Strider"
        val legolas = aragorn.length
        val gimli = legolas * 3
        println(s"More unnecessary calculations: $aragorn, $legolas, $gimli")
    }

    def yetAnotherUnnecessaryFunction(): Unit = {
        val boromir = 100
        val faramir = boromir / 2
        val denethor = faramir - 10
        println(s"Even more unnecessary calculations: $boromir, $faramir, $denethor")
    }

}