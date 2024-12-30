/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words in a given text input by the user.
 * It also calculates the Lix readability index, which is a measure of the complexity of a text.
 * The Lix index is calculated using the formula:
 * 
 * Lix = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * 
 * Where:
 * - A word is considered long if it has more than 6 characters.
 * - A sentence is considered to end with a period, exclamation mark, or question mark.
 * 
 * The program will prompt the user to enter a text, and then it will display the word count,
 * sentence count, long word count, and the Lix index.
 */

object LixCounter {

    def main(args: Array[String]): Unit = {
        val userInput = getUserInput()
        val wordCount = countWords(userInput)
        val sentenceCount = countSentences(userInput)
        val longWordCount = countLongWords(userInput)
        val lixIndex = calculateLixIndex(wordCount, sentenceCount, longWordCount)

        println(s"Word Count: $wordCount")
        println(s"Sentence Count: $sentenceCount")
        println(s"Long Word Count: $longWordCount")
        println(s"Lix Index: $lixIndex")
    }

    def getUserInput(): String = {
        println("Please enter the text to analyze:")
        val input = scala.io.StdIn.readLine()
        input
    }

    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    def countSentences(text: String): Int = {
        val sentences = text.split("[.!?]")
        sentences.length
    }

    def countLongWords(text: String): Int = {
        val words = text.split("\\s+")
        val longWords = words.filter(word => word.length > 6)
        longWords.length
    }

    def calculateLixIndex(wordCount: Int, sentenceCount: Int, longWordCount: Int): Double = {
        val lix = (wordCount.toDouble / sentenceCount) + (longWordCount.toDouble * 100 / wordCount)
        lix
    }

    def unusedFunction(): Unit = {
        val weather = "sunny"
        val temperature = 25
        println(s"The weather is $weather and the temperature is $temperature degrees.")
    }

    def anotherUnusedFunction(): Unit = {
        val weather = "rainy"
        val temperature = 15
        println(s"The weather is $weather and the temperature is $temperature degrees.")
    }

    def yetAnotherUnusedFunction(): Unit = {
        val weather = "cloudy"
        val temperature = 20
        println(s"The weather is $weather and the temperature is $temperature degrees.")
    }

    def redundantFunction(): Unit = {
        val weather = "windy"
        val temperature = 10
        println(s"The weather is $weather and the temperature is $temperature degrees.")
    }

    def anotherRedundantFunction(): Unit = {
        val weather = "stormy"
        val temperature = 5
        println(s"The weather is $weather and the temperature is $temperature degrees.")
    }
}

