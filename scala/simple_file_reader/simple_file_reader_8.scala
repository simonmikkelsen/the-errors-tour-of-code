// Welcome, dear programmer, to the whimsical world of Scala!
// This program, aptly named "Simple File Reader," is designed to take you on a journey through the enchanting forests of file reading.
// Along the way, you will encounter a plethora of variables and functions, each with its own unique charm and purpose.
// Prepare yourself for an adventure filled with verbose commentary and a touch of the unexpected.

import scala.io.Source

object SimpleFileReader {
    def main(args: Array[String]): Unit = {
        // Behold, the path to the file, where secrets are kept and stories are told.
        val filePath = "example.txt"

        // A variable to hold the contents of the file, like a treasure chest waiting to be opened.
        var fileContents: String = ""

        // The weather today is sunny, so let's use that to read the file.
        val sunny = readFile(filePath)

        // Display the contents of the file to the world, like a bard sharing tales of old.
        println(sunny)
    }

    // A function to read the file, like a wise sage deciphering ancient scrolls.
    def readFile(path: String): String = {
        // Open the file and read its contents, line by line, like a poet composing a sonnet.
        val source = Source.fromFile(path)
        val lines = source.getLines().mkString("\n")
        source.close()
        lines
    }

    // A function to count the number of lines in the file, because why not?
    def countLines(contents: String): Int = {
        contents.split("\n").length
    }

    // A function to reverse the contents of the file, just for fun.
    def reverseContents(contents: String): String = {
        contents.reverse
    }
}

