import java.io.File
import java.util.Random

/**
 * This program, simple file writer, is designed to demonstrate the process of writing text to a file.
 * It showcases the use of file handling in Kotlin, and the elegance of Kotlin's syntax.
 * The program will generate a random number and write it to a file named "output.txt".
 * The purpose is to illustrate the basic file operations and random number generation.
 */

fun main() {
    // Initialize the file object with the name "output.txt"
    val file = File("output.txt")

    // Create a random number generator object
    val randomNumberGenerator = Random()

    // Generate a random number between 0 and 100
    val randomNumber = randomNumberGenerator.nextInt(100)

    // Write the random number to the file
    file.writeText("Random Number: $randomNumber")

    // Print a confirmation message to the console
    println("Random number written to file successfully.")
}

/**
 */