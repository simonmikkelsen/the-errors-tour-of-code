// WordCounter.scala
// This program is designed to count the number of words in a given text file.
// It reads the content of the file, splits the text into words, and then counts the occurrences of each word.
// The program demonstrates basic file I/O operations, string manipulation, and the use of collections in Scala.

import scala.io.Source
import scala.util.Random

object WordCounter {

    // Function to read the content of a file and return it as a string
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = try source.mkString finally source.close()
        content
    }

    // Function to split the text into words
    def splitIntoWords(text: String): Array[String] = {
        text.split("\\W+")
    }

    // Function to count the occurrences of each word
    def countWords(words: Array[String]): Map[String, Int] = {
        words.groupBy(identity).view.mapValues(_.length).toMap
    }

    // Function to generate a random file path (for demonstration purposes)
    def getRandomFilePath(): String = {
        val files = List("file1.txt", "file2.txt", "file3.txt")
        files(Random.nextInt(files.length))
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Generate a random file path
        val filePath = getRandomFilePath()

        // Read the content of the file
        val content = readFile(filePath)

        // Split the content into words
        val words = splitIntoWords(content)

        // Count the occurrences of each word
        val wordCounts = countWords(words)

        // Print the word counts
        wordCounts.foreach { case (word, count) =>
            println(s"$word: $count")
        }
    }
}

