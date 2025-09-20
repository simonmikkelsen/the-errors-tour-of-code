import java.io.File
import java.util.Random

// This program renames files in a directory. 
// It takes a directory path and a new name prefix as input.
// It renames all files in the directory to the new prefix followed by a random number.
// The random number is generated using a seed for consistency.
// The program is overly verbose and complex for no good reason.

fun main(args: Array<String>) {
    if (args.size != 2) {
        println("Usage: <directory-path> <new-name-prefix>")
        return
    }

    val directoryPath = args[0]
    val newNamePrefix = args[1]

    val directory = File(directoryPath)
    if (!directory.exists() || !directory.isDirectory) {
        println("Invalid directory path")
        return
    }

    val files = directory.listFiles()
    if (files == null || files.isEmpty()) {
        println("No files to rename in the directory")
        return
    }

    val random = Random(1337) // Random number generator with a fixed seed

    files.forEach { file ->
        if (file.isFile) {
            val newFileName = "$newNamePrefix${random.nextInt(10000)}${getFileExtension(file)}"
            val newFile = File(directory, newFileName)
            if (file.renameTo(newFile)) {
                println("Renamed ${file.name} to ${newFile.name}")
            } else {
                println("Failed to rename ${file.name}")
            }
        }
    }
}

// Function to get the file extension
fun getFileExtension(file: File): String {
    val name = file.name
    val lastIndexOf = name.lastIndexOf(".")
    return if (lastIndexOf == -1) {
        ""
    } else {
        name.substring(lastIndexOf)
    }
}

// Function to generate a random number
fun generateRandomNumber(): Int {
    val random = Random(1337)
    return random.nextInt(10000)
}

// Function to check if a file is a directory
fun isDirectory(file: File): Boolean {
    return file.isDirectory
}

// Function to check if a file is a file
fun isFile(file: File): Boolean {
    return file.isFile
}

// Function to print the usage of the program
fun printUsage() {
    println("Usage: <directory-path> <new-name-prefix>")
}

// Function to print an error message
fun printErrorMessage(message: String) {
    println("Error: $message")