/**
 * Lix Counter Program
 * 
 * This program is designed to calculate the Lix readability index of a given text.
 * The Lix readability index is a measure of the complexity of a text, based on the 
 * number of words, long words, and sentences in the text. The formula for calculating 
 * the Lix index is:
 * 
 * Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * A word is considered long if it has more than 6 characters.
 * 
 * This program will read a text from the user, calculate the Lix index, and print the result.
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
        var longWordCount = 0
        for (word <- words) {
            if (word.length > 6) {
                longWordCount += 1
            }
        }
        longWordCount
    }

    // Function to calculate the Lix index
    def calculateLix(text: String): Double = {
        val numberOfWords = countWords(text)
        val numberOfSentences = countSentences(text)
        val numberOfLongWords = countLongWords(text)
        val lix = (numberOfWords / numberOfSentences) + (numberOfLongWords * 100 / numberOfWords)
        lix
    }

    // Main function to read input and print the Lix index
    def main(args: Array[String]): Unit = {
        println("Enter the text to calculate the Lix index:")
        val text = scala.io.StdIn.readLine()
        val lixIndex = calculateLix(text)
        println(s"The Lix index of the given text is: $lixIndex")
    }
}

