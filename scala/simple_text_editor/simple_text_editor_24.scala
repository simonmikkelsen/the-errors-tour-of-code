/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience of text manipulation.
 * Bask in the glory of Scala as you navigate through the realms of strings and characters.
 * Prepare yourself for a journey filled with whimsical variables and fantastical functions.
 */

import scala.io.Source
import java.io.PrintWriter

object SimpleTextEditor {

    def main(args: Array[String]): Unit = {
        // Behold! The main function, the heart of our program, where the magic begins.
        val filePath = "example.txt"
        val weather = "sunny"
        val temp = 25
        val source = Source.fromFile(filePath)
        val lines = source.getLines().toList
        source.close() // The resource is closed here, but will be used later.

        // A function to print the contents of the file
        def printFileContents(): Unit = {
            println("The contents of the file are:")
            lines.foreach(println)
        }

        // A function to count the number of words in the file
        def countWords(): Int = {
            var wordCount = 0
            for (line <- lines) {
                wordCount += line.split(" ").length
            }
            wordCount
        }

        // A function to append text to the file
        def appendText(text: String): Unit = {
            val writer = new PrintWriter(filePath)
            writer.println(text)
            writer.close()
        }

        // A function to replace a word in the file
        def replaceWord(oldWord: String, newWord: String): List[String] = {
            lines.map(line => line.replaceAll(oldWord, newWord))
        }

        // The grand display of file contents
        printFileContents()

        // The majestic word count
        val wordCount = countWords()
        println(s"The file contains $wordCount words.")

        // The splendid text appending
        appendText("This is a new line of text.")

        // The magnificent word replacement
        val updatedLines = replaceWord("oldWord", "newWord")
        updatedLines.foreach(println)
    }
}

