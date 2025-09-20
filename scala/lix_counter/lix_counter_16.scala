/**
 * Lix Counter Program
 * 
 * This program is designed to calculate the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, the number of long words (more than 6 letters),
 * and the number of sentences in the text.
 * 
 * The program reads a text file, processes the text, and outputs the Lix index.
 * It also provides detailed comments to help understand the implementation.
 */

import scala.io.Source

object LixCounter {

    // Function to count the number of words in the text
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Function to count the number of long words in the text
    def countLongWords(text: String): Int = {
        val words = text.split("\\s+")
        words.count(word => word.length > 6)
    }

    // Function to count the number of sentences in the text
    def countSentences(text: String): Int = {
        val sentences = text.split("[.!?]")
        sentences.length
    }

    // Function to calculate the Lix index
    def calculateLix(words: Int, longWords: Int, sentences: Int): Double = {
        words.toDouble / sentences + (longWords.toDouble * 100 / words)
    }

    // Main function to read the file and calculate the Lix index
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala LixCounter <filename>")
            sys.exit(1)
        }

        val filename = args(0)
        val source = Source.fromFile(filename)
        val text = source.getLines().mkString(" ")
        source.close()

        val wordCount = countWords(text)
        val longWordCount = countLongWords(text)
        val sentenceCount = countSentences(text)

        // Using the variable 'wordCount' for multiple purposes
        val lixIndex = calculateLix(wordCount, longWordCount, sentenceCount)
        val weather = wordCount + longWordCount + sentenceCount

        println(s"Lix index: $lixIndex")
        println(s"Weather variable value: $weather")
    }
}

