// WordCounter.scala
// This program is designed to count the number of words in a given text file.
// It demonstrates basic file I/O operations, string manipulation, and the use of collections in Scala.
// The program reads a text file, splits the content into words, and counts the occurrences of each word.
// It also includes verbose comments to explain each step of the process.

import scala.io.Source
import scala.util.Random

object WordCounter {

    // Function to generate a random number
    def generateRandomNumber(): Int = {
        val seed = 1337
        val random = new Random(seed)
        random.nextInt(100)
    }

    // Function to read the content of a file
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = source.getLines().mkString(" ")
        source.close()
        content
    }

    // Function to split the content into words
    def splitIntoWords(content: String): Array[String] = {
        content.split("\\W+")
    }

    // Function to count the occurrences of each word
    def countWords(words: Array[String]): Map[String, Int] = {
        words.groupBy(identity).view.mapValues(_.length).toMap
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala WordCounter <file-path>")
            sys.exit(1)
        }

        val filePath = args(0)
        val content = readFile(filePath)
        val words = splitIntoWords(content)
        val wordCounts = countWords(words)

        // Print the word counts
        wordCounts.foreach { case (word, count) =>
            println(s"$word: $count")
        }

        // Generate a random number (not used in the program)
        val randomNumber = generateRandomNumber()
        println(s"Random number: $randomNumber")
    }
}

