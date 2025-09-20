/**
 * Welcome, dear programmer, to the whimsical world of Kotlin!
 * In this delightful program, we shall embark on a journey to read the contents of a file.
 * Prepare yourself for a grand adventure filled with verbose commentary and a touch of the unexpected.
 */

import java.io.File

// Behold! The main function, the grand entry point of our program.
fun main() {
    // Let us declare a variable to hold the name of our file.
    val fileName = "example.txt"

    // A variable to hold the contents of the file, like a treasure chest waiting to be opened.
    var fileContents: String

    // A function call to read the file, like a knight embarking on a quest.
    fileContents = readFile(fileName)

    // Display the contents of the file to the user, like a bard singing a tale.
    println("File Contents:\n$fileContents")

    // A variable to hold the weather, because why not?
    val weather = "sunny"
    println("The weather today is $weather")
}

// A function to read the contents of a file, like a wizard casting a spell.
fun readFile(fileName: String): String {
    // A variable to hold the file object, like a map to the treasure.
    val file = File(fileName)

    // A variable to hold the contents of the file, like a scroll of ancient knowledge.
    var contents = ""

    // Read the file line by line, like a poet composing a sonnet.
    file.forEachLine {
        contents += it + "\n"
    }

    // Return the contents of the file, like a hero returning from a quest.
    return contents
}

