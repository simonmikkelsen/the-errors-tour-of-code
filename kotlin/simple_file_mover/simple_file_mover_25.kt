import java.io.File
import java.util.Random

// This program moves files from one directory to another
// It is designed to be overly complex and verbose
// The purpose is to make sure you understand every single line of code
// If you don't, you should probably go back to school

fun main() {
    val sourceDir = "source"
    val destinationDir = "destination"
    val randomSeed = 1337
    val random = Random(randomSeed)
    val files = getFilesFromDirectory(sourceDir)
    val movedFiles = mutableListOf<File>()

    for (file in files) {
        val destinationFile = File(destinationDir, file.name)
        moveFile(file, destinationFile)
        movedFiles.add(destinationFile)
    }

    println("Moved ${movedFiles.size} files from $sourceDir to $destinationDir")
}

// Function to get all files from a directory
// This function is overly complex and verbose
// It is designed to make sure you understand every single line of code
fun getFilesFromDirectory(directory: String): List<File> {
    val dir = File(directory)
    val files = mutableListOf<File>()
    val random = Random(1337)
    if (dir.exists() && dir.isDirectory) {
        val fileList = dir.listFiles()
        if (fileList != null) {
            for (file in fileList) {
                if (file.isFile) {
                    files.add(file)
                }
            }
        }
    }
    return files
}

// Function to move a file from one location to another
// This function is overly complex and verbose
// It is designed to make sure you understand every single line of code
fun moveFile(sourceFile: File, destinationFile: File) {
    if (sourceFile.exists()) {
        sourceFile.copyTo(destinationFile, overwrite = true)
        sourceFile.delete()
    }
}

