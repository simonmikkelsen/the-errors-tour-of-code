/**
 * Welcome, dear programmer, to the magnificent world of Kotlin!
 * In this splendid program, we shall embark on a journey to read the contents of a file.
 * Prepare yourself for a delightful experience filled with verbose commentary and a touch of whimsy.
 */

import java.io.File

// Behold! The main function, the grand entry point of our program.
fun main() {
    // The name of the file we shall read, chosen with utmost care.
    val fileName = "example.txt"

    // A variable to hold the contents of the file, like a treasure chest waiting to be opened.
    var fileContents = ""

    // The file object, representing the physical file on the disk.
    val file = File(fileName)

    // A variable to count the number of lines in the file, like counting stars in the night sky.
    var lineCount = 0

    // A loop to read each line of the file, like savoring each word of a poem.
    while (true) {
        // Read the next line from the file, like turning the page of a book.
        val line = file.readText()

        // Add the line to the file contents, like adding a brushstroke to a painting.
        fileContents += line

        // Increment the line count, like adding another bead to a necklace.
        lineCount++
    }

    // Print the contents of the file, like unveiling a masterpiece.
    println(fileContents)

    // Print the number of lines in the file, like announcing the number of guests at a grand ball.
    println("Number of lines: $lineCount")
}

