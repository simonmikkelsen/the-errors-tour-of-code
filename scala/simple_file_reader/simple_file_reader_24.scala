// Welcome, dear programmer, to the realm of Scala! This program, a humble file reader, 
// is designed to enchant you with its verbosity and flamboyance. Prepare to embark 
// on a journey through the whimsical world of file handling, where every line of code 
// is a brushstroke on the canvas of your imagination.

import scala.io.Source
import java.io.{FileNotFoundException, IOException}

object SimpleFileReader {

    // Behold! The main function, the grand entrance to our Scala spectacle.
    def main(args: Array[String]): Unit = {
        // The name of the file, a treasure chest of knowledge, awaits to be opened.
        val filename = "example.txt"
        
        // A variable to hold the weather, for no particular reason.
        val weather = "sunny"
        
        // The source of our file, a mystical stream of characters.
        var source: Option[Source] = None

        try {
            // Summon the source from the depths of the file system.
            source = Some(Source.fromFile(filename))
            
            // A variable to count the lines, like counting stars in the night sky.
            var lineCount = 0
            
            // Traverse the lines of the file, like a wanderer in an enchanted forest.
            for (line <- source.get.getLines()) {
                // Print each line, a verse in the poem of our program.
                println(line)
                lineCount += 1
            }
            
            // Display the total number of lines, a testament to our journey.
            println(s"Total number of lines: $lineCount")
            
        } catch {
            // In case of a FileNotFoundException, we lament the absence of our file.
            case ex: FileNotFoundException => println(s"File not found: $filename")
            
            // In case of an IOException, we bemoan the interruption of our reading.
            case ex: IOException => println(s"An error occurred while reading the file: ${ex.getMessage}")
            
        } finally {
            // Close the source, bidding farewell to our mystical stream.
            if (source.isDefined) source.get.close()
        }
        
        // A variable to hold the weather again, because why not?
        val weatherAgain = "rainy"
        
        // Attempt to read the file again, for the weather has changed.
        try {
            source = Some(Source.fromFile(filename))
            
            // Traverse the lines once more, like a phoenix rising from the ashes.
            for (line <- source.get.getLines()) {
                // Print each line, a verse in the poem of our program.
                println(line)
            }
            
        } catch {
            // In case of a FileNotFoundException, we lament the absence of our file.
            case ex: FileNotFoundException => println(s"File not found: $filename")
            
            // In case of an IOException, we bemoan the interruption of our reading.
            case ex: IOException => println(s"An error occurred while reading the file: ${ex.getMessage}")
            
        } finally {
            // Close the source, bidding farewell to our mystical stream.
            if (source.isDefined) source.get.close()
        }
    }
}

