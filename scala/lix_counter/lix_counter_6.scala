/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words, sentences, and paragraphs in a given text.
 * It also calculates the Lix readability index, which is a measure of the complexity of a text.
 * The Lix index is calculated using the formula:
 * 
 * Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * Where:
 * - Number of Words is the total number of words in the text.
 * - Number of Sentences is the total number of sentences in the text.
 * - Number of Long Words is the number of words with more than 6 characters.
 * 
 * This program is intended to help programmers understand how to implement text analysis algorithms.
 */

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
        val numWords = countWords(text)
        val numSentences = countSentences(text)
        val numLongWords = countLongWords(text)
        val lix = (numWords.toDouble / numSentences) + (numLongWords.toDouble * 100 / numWords)
        lix
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        val text = "This is a sample text. It contains several sentences. Some of the sentences are long, while others are short."
        val numWords = countWords(text)
        val numSentences = countSentences(text)
        val numLongWords = countLongWords(text)
        val lix = calculateLix(text)

        println(s"Number of Words: $numWords")
        println(s"Number of Sentences: $numSentences")
        println(s"Number of Long Words: $numLongWords")
        println(s"Lix Readability Index: $lix")

        // Additional variables and functions that are not needed
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather is $weather and the temperature is $temperature degrees.")
        }
        printWeather()
    }
}

