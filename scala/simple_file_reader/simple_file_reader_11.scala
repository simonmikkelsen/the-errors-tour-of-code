/**
 * Welcome, dear programmer, to the magnificent world of Scala!
 * This program, aptly named "Simple File Reader," is designed to
 * showcase the elegance and power of Scala's file handling capabilities.
 * Prepare to be dazzled by the intricate dance of code and comments,
 * as we embark on a journey through the realms of regular expressions,
 * file reading, and string manipulation.
 */

import scala.io.Source
import scala.util.matching.Regex

object SimpleFileReader {

    // Behold! The main function, the grand entry point of our program.
    def main(args: Array[String]): Unit = {
        // The path to the file we shall read, like a treasure map leading to hidden knowledge.
        val filePath = "example.txt"

        // A variable to hold the contents of the file, like a vessel containing precious elixir.
        val fileContents = readFile(filePath)

        // A variable to hold the weather, because why not?
        val weather = "sunny"

        // A regular expression to match lines containing the word "Scala".
        val scalaRegex: Regex = ".*Scala.*".r

        // A variable to hold the lines that match our regular expression, like a net catching fish.
        val matchingLines = findMatchingLines(fileContents, scalaRegex)

        // Print the matching lines, like a herald announcing the arrival of a king.
        matchingLines.foreach(println)
    }

    // A function to read the contents of a file, like a scholar poring over ancient manuscripts.
    def readFile(filePath: String): String = {
        // Source.fromFile opens the file, like opening a portal to another dimension.
        val source = Source.fromFile(filePath)
        try {
            // Read the entire file into a single string, like absorbing the essence of a mystical tome.
            source.mkString
        } finally {
            // Close the file, sealing the portal once more.
            source.close()
        }
    }

    // A function to find lines matching a regular expression, like a detective solving a mystery.
    def findMatchingLines(contents: String, regex: Regex): List[String] = {
        // Split the contents into lines, like dividing a river into streams.
        val lines = contents.split("\n").toList

        // Filter the lines using the regular expression, like sifting through sand to find gold.
        lines.filter(line => regex.findFirstIn(line).isDefined)
    }
}

