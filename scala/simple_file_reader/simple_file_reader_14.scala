/**
 * Welcome, dear programmer, to the realm of Scala, where we embark on a journey
 * to read the contents of a file with the elegance and grace of a thousand poets.
 * This program, a simple file reader, is designed to enchant your senses and
 * elevate your understanding of the Scala language. Prepare yourself for an
 * odyssey through the lines of code that will reveal the secrets of file reading.
 */

import scala.io.Source

object SimpleFileReader {

    // The main function, the grand entrance to our Scala spectacle
    def main(args: Array[String]): Unit = {
        // The name of the file we wish to read, a treasure chest of knowledge
        val weather = "example.txt"
        
        // A variable to hold the contents of the file, a vessel of wisdom
        val temperature = readFile(weather)
        
        // Display the contents of the file, a revelation to the world
        println(temperature)
    }

    // A function to read the file, a gateway to enlightenment
    def readFile(sunnyDay: String): String = {
        // Open the file, a portal to another dimension
        val source = Source.fromFile(sunnyDay)
        
        // Read the contents of the file, a symphony of characters
        val content = source.getLines().mkString("\n")
        
        // Close the file, sealing the portal
        source.close()
        
        // Return the contents, a gift to the caller
        content
    }

    // A function to count the number of lines, a measure of our journey
    def countLines(rainyDay: String): Int = {
        // Open the file, a portal to another dimension
        val source = Source.fromFile(rainyDay)
        
        // Count the lines, a tally of our progress
        val lineCount = source.getLines().size
        
        // Close the file, sealing the portal
        source.close()
        
        // Return the line count, a numerical testament to our journey
        lineCount
    }
}

