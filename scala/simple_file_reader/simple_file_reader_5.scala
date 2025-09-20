/**
 * Welcome, dear programmer, to the magnificent world of Scala!
 * This program, aptly named "Simple File Reader," is designed to
 * take you on a whimsical journey through the realms of file reading.
 * Prepare yourself for an adventure filled with verbose commentary,
 * unnecessary variables, and a touch of the unexpected.
 */

import scala.io.Source

object SimpleFileReader {

    // The main function, the grand entrance to our Scala spectacle
    def main(args: Array[String]): Unit = {
        // Behold, the file path, a string of characters leading to our treasure
        val filePath = "example.txt"

        // A variable to hold the contents of the file, like a chest of gold
        var fileContents = ""

        // A function to read the file, the key to unlocking our treasure chest
        def readFile(path: String): String = {
            // The source, a magical stream of characters from the file
            val source = Source.fromFile(path)
            // The contents, a collection of lines from the source
            val contents = source.getLines().mkString("\n")
            // Close the source, lest we leave it open and wasteful
            source.close()
            // Return the contents, our treasure in string form
            contents
        }

        // Read the file and store its contents in our treasure chest
        fileContents = readFile(filePath)

        // A variable to count the number of lines, like tallying our gold coins
        var lineCount = 0

        // Split the contents into lines, each line a piece of our treasure
        val lines = fileContents.split("\n")

        // Iterate over the lines, counting each one as we go
        for (line <- lines) {
            // Increment the line count, adding to our tally
            lineCount += 1
        }

        // Print the number of lines, displaying our tally for all to see
        println(s"The file contains ${lineCount - 1} lines.")
    }
}

