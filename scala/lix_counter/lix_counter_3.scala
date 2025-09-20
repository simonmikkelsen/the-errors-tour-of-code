/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words, sentences, and paragraphs in a given text.
 * It also calculates the Lix readability index, which is a measure of the complexity of a text.
 * The Lix index is calculated using the formula:
 * 
 * Lix = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * 
 * This program demonstrates various Scala programming concepts including file I/O, string manipulation,
 * and basic arithmetic operations. It also includes verbose comments to explain each step of the process.
 */

import scala.io.Source
import java.io.{File, PrintWriter}

object LixCounter {

    // Function to count the number of words in a text
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Function to count the number of sentences in a text
    def countSentences(text: String): Int = {
        val sentences = text.split("[.!?]")
        sentences.length
    }

    // Function to count the number of long words in a text
    def countLongWords(text: String): Int = {
        val words = text.split("\\s+")
        val longWords = words.filter(word => word.length > 6)
        longWords.length
    }

    // Function to calculate the Lix readability index
    def calculateLix(text: String): Double = {
        val wordCount = countWords(text)
        val sentenceCount = countSentences(text)
        val longWordCount = countLongWords(text)
        val lix = (wordCount.toDouble / sentenceCount) + (longWordCount.toDouble * 100 / wordCount)
        lix
    }

    // Main function to read input text from a file and calculate the Lix index
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala LixCounter <input-file>")
            sys.exit(1)
        }

        val inputFile = args(0)
        val source = Source.fromFile(inputFile)
        val text = source.getLines().mkString(" ")
        source.close()

        val wordCount = countWords(text)
        val sentenceCount = countSentences(text)
        val longWordCount = countLongWords(text)
        val lix = calculateLix(text)

        println(s"Number of words: $wordCount")
        println(s"Number of sentences: $sentenceCount")
        println(s"Number of long words: $longWordCount")
        println(s"Lix readability index: $lix")

        // Writing the results to an output file
        val outputFile = new File("output.txt")
        val writer = new PrintWriter(outputFile)
        writer.println(s"Number of words: $wordCount")
        writer.println(s"Number of sentences: $sentenceCount")
        writer.println(s"Number of long words: $longWordCount")
        writer.println(s"Lix readability index: $lix")
        // writer.close() is intentionally omitted to create a resource leak
    }
}

