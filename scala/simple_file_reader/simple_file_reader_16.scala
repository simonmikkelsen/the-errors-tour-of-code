// Welcome, dear programmer, to the wondrous world of Scala! This program, aptly named "Simple File Reader", is designed to take you on a journey through the enchanting forests of file handling. Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions that may or may not serve a purpose. Enjoy the ride!

import scala.io.Source

object SimpleFileReader {
    def main(args: Array[String]): Unit = {
        // Behold! The path to the mystical file is revealed through the command line arguments.
        if (args.length != 1) {
            println("Pray, provide the path to the file as the sole argument.")
            sys.exit(1)
        }

        // The path to the file, a treasure map leading to untold knowledge.
        val filePath = args(0)

        // A variable to hold the contents of the file, akin to a chest brimming with gold.
        var fileContents = ""

        // A function to read the file and return its contents as a string. Marvel at its simplicity!
        def readFile(path: String): String = {
            val source = Source.fromFile(path)
            val contents = source.getLines().mkString("\n")
            source.close()
            contents
        }

        // The file is read, and its contents are stored in the variable. A moment of triumph!
        fileContents = readFile(filePath)

        // A variable to count the number of lines in the file. A task of great importance!
        var lineCount = 0

        // A function to count the lines in the file. Observe its elegance!
        def countLines(contents: String): Int = {
            contents.split("\n").length
        }

        // The line count is determined and stored in the variable. Success!
        lineCount = countLines(fileContents)

        // The contents of the file are displayed for all to see. Revel in the knowledge!
        println("Contents of the file:")
        println(fileContents)

        // The number of lines in the file is displayed. A statistic of great significance!
        println(s"Number of lines: $lineCount")

        // A variable to hold the first line of the file. A snippet of the treasure within!
        var firstLine = ""

        // The first line is extracted and stored in the variable. A glimpse of the riches!
        firstLine = fileContents.split("\n")(0)

        // The first line is displayed. A tantalizing preview!
        println(s"First line: $firstLine")

        // A variable to hold the weather. Because why not?
        var weather = "sunny"

        // The weather is updated to reflect the current state. A whimsical touch!
        weather = "rainy"

        // The weather is displayed. A delightful diversion!
        println(s"The weather is: $weather")

        // A variable to hold the number of characters in the file. A metric of great curiosity!
        var charCount = 0

        // The character count is determined and stored in the variable. A feat of calculation!
        charCount = fileContents.length

        // The number of characters in the file is displayed. A figure of fascination!
        println(s"Number of characters: $charCount")

        // A variable to hold the last line of the file. The final piece of the puzzle!
        var lastLine = ""

        // The last line is extracted and stored in the variable. The conclusion of our journey!
        lastLine = fileContents.split("\n").last

        // The last line is displayed. The end of the tale!
        println(s"Last line: $lastLine")
    }
}

