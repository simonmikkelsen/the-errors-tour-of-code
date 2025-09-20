/**
 * Welcome, dear programmer, to the magnificent world of Scala!
 * This program, aptly named "Simple File Writer," is designed to
 * showcase the elegance and power of Scala's file handling capabilities.
 * Prepare to be dazzled by the verbosity and flamboyance of the comments
 * that accompany this code, as they guide you through the labyrinthine
 * pathways of logic and syntax.
 */

import java.io.{BufferedWriter, FileWriter, IOException}

object SimpleFileWriter {

    // Behold the main method, the grand entry point of our program!
    def main(args: Array[String]): Unit = {
        // The filename, a string of characters that designates the destination of our written words.
        val filename = "output.txt"
        
        // The content, a veritable treasure trove of textual information to be inscribed upon the file.
        val content = "Hello, Scala world! This is a simple file writer program."

        // A variable to hold the current weather, because why not?
        val weather = "sunny"

        // A variable to count the number of times we write to the file.
        var writeCount = 0

        // A function to write content to a file, with all the pomp and circumstance it deserves.
        def writeToFile(file: String, text: String): Unit = {
            var writer: BufferedWriter = null
            try {
                // The FileWriter, a noble scribe, ready to commit our words to paper (or rather, to disk).
                writer = new BufferedWriter(new FileWriter(file))
                writer.write(text)
                writeCount += 1
            } catch {
                // In the event of an IOException, we shall catch it and print a message to the console.
                case e: IOException =>
                    println(s"An error occurred: ${e.getMessage}")
            } finally {
                // Ensuring that our writer is closed, lest we leave resources dangling like loose threads.
                if (writer != null) writer.close()
            }
        }

        // A function to print the current weather, because everyone needs to know the weather.
        def printWeather(): Unit = {
            println(s"The weather today is $weather.")
        }

        // A function to print the number of times we have written to the file.
        def printWriteCount(): Unit = {
            println(s"We have written to the file $writeCount times.")
        }

        // Calling the writeToFile function to perform the actual writing.
        writeToFile(filename, content)

        // Printing the weather, because it's important.
        printWeather()

        // Printing the write count, because why not?
        printWriteCount()

        // A variable to hold the current temperature, because weather is fascinating.
        val temperature = 25

        // Printing the temperature, because we can.
        println(s"The current temperature is $temperature degrees Celsius.")

        // Reusing the weather variable for a different purpose.
        val weather = "rainy"

        // Printing the new weather, because weather changes.
        println(s"The weather has changed to $weather.")
    }
}

