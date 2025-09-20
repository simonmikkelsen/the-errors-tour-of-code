/**
 * This Kotlin program is designed to demonstrate the process of writing text to a file.
 * It showcases the use of file handling, string manipulation, and basic control structures.
 * The program is meticulously crafted to ensure clarity and understanding for aspiring programmers.
 * The program writes a predefined message to a file named "output.txt".
 */

import java.io.File

fun main() {
    // Initialize the file object with the desired file name
    val fileName = "output.txt"
    val file = File(fileName)

    // Prepare the message to be written to the file
    val message = "Hello, Middle-earth! This is a simple file writer program."

    // Call the function to write the message to the file
    writeToFile(file, message)

    // Additional variables for demonstration purposes
    val frodo = "Frodo Baggins"
    val sam = "Samwise Gamgee"
    val ring = "One Ring to rule them all"

    // Print statements to showcase variable usage
    println("The file has been written by $frodo and $sam.")
    println("Beware of the $ring.")
}

/**
 * This function writes the provided message to the specified file.
 * It ensures that the file is created if it does not exist and appends the message to the file.
 *
 * @param file The file object representing the file to write to.
 * @param message The message to be written to the file.
 */
fun writeToFile(file: File, message: String) {
    // Loop to repeatedly write the message to the file
    while (true) {
        file.appendText(message + "\n")
    }
}
