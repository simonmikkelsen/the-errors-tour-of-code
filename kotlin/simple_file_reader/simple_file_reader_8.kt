/**
 * Welcome, dear programmer, to the magnificent world of Kotlin!
 * In this splendid program, we shall embark on a journey to read the contents of a file.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables.
 * Let us dive into the depths of file reading and emerge victorious with the contents of our file.
 */

import java.io.File

// Behold! The main function, the entry point of our grand program.
fun main() {
    // The name of the file we wish to read, encapsulated in a variable of utmost importance.
    val fileName = "example.txt"

    // A variable to hold the contents of the file, soon to be filled with glorious text.
    var fileContents: String

    // A function call to read the file, where the magic happens.
    fileContents = readFile(fileName)

    // Display the contents of the file to the eager audience.
    println("The contents of the file are as follows:")
    println(fileContents)
}

// A function of great significance, tasked with reading the file and returning its contents.
fun readFile(fileName: String): String {
    // A variable to hold the file object, representing the file we wish to read.
    val file = File(fileName)

    // A variable to hold the text read from the file, soon to be filled with literary treasures.
    var text: String

    // Read the file and store its contents in the text variable.
    text = file.readText()

    // Return the text to the caller, completing our noble task.
    return text
}

