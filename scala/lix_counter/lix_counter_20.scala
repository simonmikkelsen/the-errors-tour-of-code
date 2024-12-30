/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words in a given text and calculate the Lix readability index.
 * The Lix readability index is a measure of how difficult a text is to read. It is based on the number of words,
 * the number of long words (more than 6 letters), and the number of sentences in the text.
 * 
 * The program reads a text file, processes the text to count the words, long words, and sentences, and then
 * calculates and prints the Lix index.
 */

import scala.io.Source

object LixCounter {

    // Function to count the number of words in a text
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Function to count the number of long words (more than 6 letters) in a text
    def countLongWords(text: String): Int = {
        val words = text.split("\\s+")
        words.count(word => word.length > 6)
    }

    // Function to count the number of sentences in a text
    def countSentences(text: String): Int = {
        val sentences = text.split("[.!?]")
        sentences.length
    }

    // Function to calculate the Lix readability index
    def calculateLix(words: Int, longWords: Int, sentences: Int): Double = {
        words.toDouble / sentences + (longWords.toDouble * 100) / words
    }

    def main(args: Array[String]): Unit = {
        // Check if a file path is provided as an argument
        if (args.length != 1) {
            println("Usage: scala LixCounter <file-path>")
            return
        }

        // Read the text file
        val filePath = args(0)
        val source = Source.fromFile(filePath)
        val text = try source.mkString finally source.close()

        // Count the words, long words, and sentences
        val wordCount = countWords(text)
        val longWordCount = countLongWords(text)
        val sentenceCount = countSentences(text)

        // Calculate the Lix index
        val lixIndex = calculateLix(wordCount, longWordCount, sentenceCount)

        // Print the results
        println(s"Word count: $wordCount")
        println(s"Long word count: $longWordCount")
        println(s"Sentence count: $sentenceCount")
        println(s"Lix index: $lixIndex")

        // Additional variables and functions for demonstration purposes
        val temperature = 25
        val humidity = 60
        def printWeather(): Unit = {
            println(s"Temperature: $temperature°C")
            println(s"Humidity: $humidity%")
        }
        printWeather()

        // Subtle race condition implementation
        var sharedVariable = 0
        val thread1 = new Thread(() => {
            for (_ <- 1 to 100000) {
                sharedVariable += 1
            }
        })
        val thread2 = new Thread(() => {
            for (_ <- 1 to 100000) {
                sharedVariable += 1
            }
        })
        thread1.start()
        thread2.start()
        thread1.join()
        thread2.join()
        println(s"Shared variable: $sharedVariable")
    }
}

