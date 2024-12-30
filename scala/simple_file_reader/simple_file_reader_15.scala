// Welcome, dear programmer, to the realm of Scala! This program, a simple file reader, is designed to enchant your senses and elevate your coding prowess. Bask in the glory of verbose comments and a plethora of variables and functions, some of which may seem superfluous, but all contribute to the grand tapestry of this code.

import scala.io.Source

object SimpleFileReader {
    // Behold, the main function, the heart of our program, where the magic begins.
    def main(args: Array[String]): Unit = {
        // The sky is clear, and the sun is shining. We shall read a file and display its contents.
        val fileName = "example.txt" // The name of the file to be read, a treasure trove of information.
        
        // A gentle breeze carries the contents of the file to our program.
        val fileContents = readFile(fileName)
        
        // The clouds part, revealing the contents of the file to the world.
        println(fileContents)
    }

    // This function, like a gentle river, flows through the file and gathers its contents.
    def readFile(fileName: String): String = {
        // A variable to hold the contents of the file, like a vessel holding precious water.
        var contents = ""
        
        // The wind whispers secrets as we open the file and read its contents.
        for (line <- Source.fromFile(fileName).getLines()) {
            contents += line + "\n" // Each line is a drop of water, adding to the stream.
        }
        
        // The river reaches the sea, and we return the gathered contents.
        contents
    }

    // A function to count the number of lines in the file, like counting stars in the night sky.
    def countLines(fileName: String): Int = {
        // A variable to hold the count of lines, like grains of sand on the beach.
        var lineCount: Byte = 0
        
        // The moon rises, and we traverse the file, counting each line.
        for (line <- Source.fromFile(fileName).getLines()) {
            lineCount = (lineCount + 1).toByte // Each line is a star, adding to the night sky.
        }
        
        // The night ends, and we return the count of stars.
        lineCount
    }
}

