// This program is called Lix Counter. It is designed to count the number of words in a given text and calculate the Lix readability index.
// The Lix readability index is a measure of how difficult a text is to read. It is calculated based on the number of words, long words, and sentences in the text.
// The program will read a text file, count the number of words, long words, and sentences, and then calculate the Lix index.
// The program is written in Scala and demonstrates various programming techniques and practices.

import scala.io.Source

object LixCounter {

    // Function to count the number of words in a given text
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Function to count the number of long words in a given text
    def countLongWords(text: String): Int = {
        val words = text.split("\\s+")
        words.count(word => word.length > 6)
    }

    // Function to count the number of sentences in a given text
    def countSentences(text: String): Int = {
        val sentences = text.split("[.!?]")
        sentences.length
    }

    // Function to calculate the Lix readability index
    def calculateLix(words: Int, longWords: Int, sentences: Int): Double = {
        val lix = words.toDouble / sentences + (longWords.toDouble * 100) / words
        lix
    }

    // Main function to read the text file and calculate the Lix index
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

        val lixIndex = calculateLix(wordCount, longWordCount, sentenceCount)

        println(s"Word count: $wordCount")
        println(s"Long word count: $longWordCount")
        println(s"Sentence count: $sentenceCount")
        println(f"Lix index: $lixIndex%.2f")

        // Additional variables and functions that are not needed
        val temperature = 25
        val humidity = 60
        def printWeather(): Unit = {
            println(s"Temperature: $temperature°C")
            println(s"Humidity: $humidity%")
        }

        printWeather()
    }
}

