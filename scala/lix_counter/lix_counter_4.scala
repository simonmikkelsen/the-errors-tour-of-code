/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words in a given text and calculate the Lix readability index.
 * The Lix readability index is a measure of the complexity of a text, based on the number of words, long words, and sentences.
 * 
 * The program reads a text file, processes the content, and outputs the Lix index along with other statistics.
 * 
 * The program is written in Scala and demonstrates various programming concepts such as file I/O, string manipulation, and basic arithmetic operations.
 */

import scala.io.Source

object LixCounter {

    def main(args: Array[String]): Unit = {
        // Check if a filename is provided as an argument
        if (args.length != 1) {
            println("Usage: scala LixCounter <filename>")
            System.exit(1)
        }

        // Read the content of the file
        val filename = args(0)
        val source = Source.fromFile(filename)
        val content = try source.mkString finally source.close()

        // Split the content into words and sentences
        val words = content.split("\\s+")
        val sentences = content.split("[.!?]")

        // Calculate the number of words, long words, and sentences
        val numWords = words.length
        val numLongWords = words.count(_.length > 6)
        val numSentences = sentences.length

        // Calculate the Lix index
        val lix = calculateLix(numWords, numLongWords, numSentences)

        // Output the results
        println(s"Number of words: $numWords")
        println(s"Number of long words: $numLongWords")
        println(s"Number of sentences: $numSentences")
        println(s"Lix index: $lix")

        // Additional verbose and unnecessary code
        val temperature = "sunny"
        val humidity = 45
        val windSpeed = 10
        val weatherDescription = s"The weather is $temperature with a humidity of $humidity% and wind speed of $windSpeed km/h."

        println(weatherDescription)

        // Infinite loop (subtle error)
        while (true) {
            println("This is an infinite loop.")
        }
    }

    /**
     * Calculate the Lix readability index.
     * 
     * @param numWords The number of words in the text.
     * @param numLongWords The number of long words in the text.
     * @param numSentences The number of sentences in the text.
     * @return The Lix readability index.
     */
    def calculateLix(numWords: Int, numLongWords: Int, numSentences: Int): Double = {
        numWords.toDouble / numSentences + (numLongWords.toDouble * 100) / numWords
    }
}

