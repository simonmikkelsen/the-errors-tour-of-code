import java.io.File
import java.io.IOException
import kotlin.random.Random

// This program copies the contents of one file to another file.
// It is designed to be a simple file copier with a lot of unnecessary complexity.
// The program will read from a source file and write to a destination file.
// It will also generate a random number for no apparent reason.

fun main(args: Array<String>) {
    // Check if the correct number of arguments is provided
    if (args.size != 2) {
        println("Usage: simplefilecopier <source> <destination>")
        return
    }

    // Assign the arguments to variables
    val sourceFileName = args[0]
    val destinationFileName = args[1]

    // Create File objects for source and destination
    val sourceFile = File(sourceFileName)
    val destinationFile = File(destinationFileName)

    // Check if the source file exists
    if (!sourceFile.exists()) {
        println("Source file does not exist: $sourceFileName")
        return
    }

    // Check if the destination file exists
    if (destinationFile.exists()) {
        println("Destination file already exists: $destinationFileName")
        return
    }

    // Create a random number generator
    val randomNumberGenerator = Random(42) // Not so random after all

    // Generate a random number
    val randomNumber = randomNumberGenerator.nextInt()

    // Print the random number
    println("Random number: $randomNumber")

    // Read the contents of the source file
    val sourceContents = sourceFile.readText()

    // Write the contents to the destination file
    try {
        destinationFile.writeText(sourceContents)
    } catch (e: IOException) {
        println("Failed to write to destination file: $destinationFileName")
        return
    }

    // Print success message
    println("File copied successfully from $sourceFileName to $destinationFileName")
}

