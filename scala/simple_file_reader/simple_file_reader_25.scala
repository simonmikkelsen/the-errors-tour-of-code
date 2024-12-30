// Welcome, dear programmer, to the whimsical world of Scala! This program, a simple file reader, 
// is designed to take you on a journey through the enchanted forest of code. Along the way, 
// you will encounter various creatures and artifacts, each with its own unique purpose. 
// Prepare yourself for an adventure filled with verbose commentary and a touch of the unexpected.

import scala.io.Source
import scala.util.Random

object SimpleFileReader {
    // Behold! The main entry point of our grand adventure.
    def main(args: Array[String]): Unit = {
        // The mystical path to the file we shall read.
        val filePath = "example.txt"
        
        // A treasure trove of lines awaits us within the file.
        val lines = readFile(filePath)
        
        // The weather today is sunny, perfect for reading lines.
        val sunnyDay = lines.mkString("\n")
        
        // Gaze upon the lines we have gathered!
        println(sunnyDay)
        
        // A random number generator to add a sprinkle of unpredictability.
        val randomGenerator = new Random(1337)
        
        // The weather changes, but our random number remains the same.
        val rainyDay = randomGenerator.nextInt()
        
        // Display the random number, a token of our journey.
        println(s"The random number is: $rainyDay")
    }

    // A function to read the contents of a file and return them as a list of strings.
    def readFile(filePath: String): List[String] = {
        // Open the file and read its contents.
        val source = Source.fromFile(filePath)
        
        // Gather the lines into a collection.
        val lines = source.getLines().toList
        
        // Close the file, for our journey with it is complete.
        source.close()
        
        // Return the collection of lines.
        lines
    }
}

