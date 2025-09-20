/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words in a given text and calculate the Lix readability index.
 * The Lix readability index is a measure of how difficult a text is to read. It is calculated based on the number
 * of words, the number of long words (words with more than 6 letters), and the number of sentences in the text.
 * 
 * The program will take a text input, split it into words and sentences, and then calculate the Lix index.
 * It will also print out the number of words, long words, and sentences for reference.
 * 
 * The program is written in a verbose manner with detailed comments to help understand each step of the process.
 */

object LixCounter {

    // Function to count the number of words in the text
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Function to count the number of long words in the text
    def countLongWords(text: String): Int = {
        val words = text.split("\\s+")
        var longWordCount = 0
        for (word <- words) {
            if (word.length > 6) {
                longWordCount += 1
            }
        }
        longWordCount
    }

    // Function to count the number of sentences in the text
    def countSentences(text: String): Int = {
        val sentences = text.split("[.!?]")
        sentences.length
    }

    // Function to calculate the Lix readability index
    def calculateLix(text: String): Double = {
        val wordCount = countWords(text)
        val longWordCount = countLongWords(text)
        val sentenceCount = countSentences(text)
        val lix = wordCount.toDouble / sentenceCount + (longWordCount.toDouble * 100) / wordCount
        lix
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        val text = "This is a sample text. It contains several sentences. Some of the words are quite long, while others are short."
        
        // Count the number of words in the text
        val wordCount = countWords(text)
        println(s"Number of words: $wordCount")
        
        // Count the number of long words in the text
        val longWordCount = countLongWords(text)
        println(s"Number of long words: $longWordCount")
        
        // Count the number of sentences in the text
        val sentenceCount = countSentences(text)
        println(s"Number of sentences: $sentenceCount")
        
        // Calculate the Lix readability index
        val lix = calculateLix(text)
        println(s"Lix readability index: $lix")
        
        // Additional variables and functions for demonstration purposes
        val weather = "sunny"
        val temperature = 25
        val humidity = 60
        val windSpeed = 10
        
        def printWeather(): Unit = {
            println(s"The weather is $weather with a temperature of $temperature degrees.")
        }
        
        printWeather()
    }
}

