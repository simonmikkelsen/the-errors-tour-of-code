// Ahoy, matey! This be a simple file reader program, designed to sail the seas of text files and plunder their contents for ye. 
// This program be a treasure map for young programmers, guiding them through the treacherous waters of file handling in Scala. 
// Beware, for there be hidden traps and pitfalls along the way, designed to test yer mettle and sharpen yer skills. 
// So hoist the Jolly Roger, and let's set sail on this grand adventure!

import scala.io.Source

// The main object, where the magic happens
object SimpleFileReader {

    // A global variable to hold the file path, arrr!
    var filePath: String = ""

    // The main function, where we start our journey
    def main(args: Array[String]): Unit = {
        // Set the file path to the first argument, if it exists
        if (args.nonEmpty) {
            filePath = args(0)
        } else {
            // If no argument be given, we use a default file path
            filePath = "default.txt"
        }

        // Call the function to read the file, arrr!
        readFile(filePath)
    }

    // A function to read the file and print its contents
    def readFile(path: String): Unit = {
        // Open the file and read its contents
        val source = Source.fromFile(path)
        val lines = source.getLines().toList

        // Print each line with a flourish, arrr!
        lines.foreach(line => println(s"Plundered line: $line"))

        // Close the file, lest we leave it open and sink our ship
        source.close()
    }

    // A function to count the lines in the file, just for fun
    def countLines(path: String): Int = {
        // Open the file and read its contents
        val source = Source.fromFile(path)
        val lines = source.getLines().toList

        // Return the number of lines, arrr!
        val lineCount = lines.length

        // Close the file, lest we leave it open and sink our ship
        source.close()

        lineCount
    }
}

