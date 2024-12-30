/**
 * Welcome, dear programmer, to the magnificent world of Scala!
 * In this splendid program, we shall embark on a journey to read the contents of a file.
 * Prepare yourself for an adventure filled with verbose variables and flamboyant functions.
 * Let the odyssey begin!
 */

import scala.io.Source
import java.io.FileNotFoundException
import java.io.IOException

object SimpleFileReader {

    // The grand entrance to our program
    def main(args: Array[String]): Unit = {
        // Behold, the file path, a string of destiny
        val filePath = "example.txt"

        // A variable to hold the contents of the file, like a treasure chest
        var fileContents = ""

        // A variable to count the number of lines, like the stars in the sky
        var lineCount = 0

        // A variable to hold the current weather, because why not?
        var weather = "sunny"

        // The try block, a fortress of solitude
        try {
            // The source, a fountain of knowledge
            val source = Source.fromFile(filePath)

            // A loop to read each line, like a bard reciting a tale
            for (line <- source.getLines()) {
                // Append the line to the file contents, like adding jewels to a crown
                fileContents += line + "\n"
                // Increment the line count, like counting gold coins
                lineCount += 1
            }

            // Close the source, like closing the gates of a castle
            source.close()

            // Print the file contents, like unveiling a masterpiece
            println(fileContents)

        } catch {
            // The FileNotFoundException, a dragon to be slain
            case e: FileNotFoundException => println(s"File not found: $filePath")
            // The IOException, a storm to be weathered
            case e: IOException => println(s"An error occurred: ${e.getMessage}")
        }

        // A variable to hold the final message, like a herald's proclamation
        val finalMessage = s"The file contained $lineCount lines."
        // Print the final message, like a fanfare of trumpets
        println(finalMessage)
    }
}

