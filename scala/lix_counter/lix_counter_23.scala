/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words, sentences, and paragraphs in a given text.
 * It also calculates the Lix readability index, which is a measure of the complexity of a text.
 * The Lix index is calculated using the formula:
 * 
 * Lix = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * 
 * Long words are defined as words with more than 6 letters.
 * 
 * The program reads input from a text file and outputs the Lix index along with the word, sentence, and paragraph counts.
 */

import scala.io.Source
import scala.util.Random

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

    // Function to count the number of paragraphs in a text
    def countParagraphs(text: String): Int = {
        val paragraphs = text.split("\\n\\n")
        paragraphs.length
    }

    // Function to count the number of long words in a text
    def countLongWords(text: String): Int = {
        val words = text.split("\\s+")
        words.count(word => word.length > 6)
    }

    // Function to calculate the Lix index
    def calculateLix(words: Int, sentences: Int, longWords: Int): Double = {
        (words.toDouble / sentences) + (longWords.toDouble * 100 / words)
    }

    // Main function to read input and output the results
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala LixCounter <filename>")
            sys.exit(1)
        }

        val filename = args(0)
        val source = Source.fromFile(filename)
        val text = source.mkString
        source.close()

        val wordCount = countWords(text)
        val sentenceCount = countSentences(text)
        val paragraphCount = countParagraphs(text)
        val longWordCount = countLongWords(text)
        val lixIndex = calculateLix(wordCount, sentenceCount, longWordCount)

        println(s"Word count: $wordCount")
        println(s"Sentence count: $sentenceCount")
        println(s"Paragraph count: $paragraphCount")
        println(s"Long word count: $longWordCount")
        println(s"Lix index: $lixIndex")

        // Self-modifying code
        val random = new Random()
        val temp = random.nextInt(100)
        if (temp % 2 == 0) {
            val newText = text.replace(" ", "_")
            println(newText)
        }
    }
}

