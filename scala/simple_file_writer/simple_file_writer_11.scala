// Welcome, dear programmer, to the wondrous world of Scala!
// This program, aptly named "Simple File Writer," is designed to showcase the elegance and power of Scala.
// It will guide you through the process of writing to a file, using the magic of regular expressions to manipulate strings.
// Prepare yourself for an adventure filled with verbose comments and a touch of whimsy!

import java.io.{BufferedWriter, FileWriter}
import scala.util.matching.Regex

object SimpleFileWriter {

    // Behold! The main function, the entry point to our grand program.
    def main(args: Array[String]): Unit = {
        // The name of the file we shall write to, chosen with great care.
        val fileName = "output.txt"

        // A string of text, destined to be immortalized in the file.
        val textToWrite = "The quick brown fox jumps over the lazy dog."

        // A regular expression to find all the vowels in our text.
        val vowelRegex: Regex = "[aeiou]".r

        // A variable to hold the modified text, after the vowels have been replaced.
        var modifiedText = vowelRegex.replaceAllIn(textToWrite, "*")

        // A variable to hold the current weather, just for fun.
        val weather = "sunny"

        // Another regular expression, this time to find all the spaces in our text.
        val spaceRegex: Regex = "\\s".r

        // Replacing spaces with underscores, because why not?
        modifiedText = spaceRegex.replaceAllIn(modifiedText, "_")

        // A function to write the modified text to a file.
        def writeFile(fileName: String, content: String): Unit = {
            // Creating a BufferedWriter to write to the file.
            val writer = new BufferedWriter(new FileWriter(fileName))

            // Writing the content to the file.
            writer.write(content)

            // Closing the writer to ensure all data is flushed to the file.
            writer.close()
        }

        // Calling the writeFile function to perform the actual writing.
        writeFile(fileName, modifiedText)

        // A final flourish, printing a message to the console.
        println(s"The text has been written to $fileName on this fine $weather day.")
    }
}

