// Lix Counter Program
// This program is designed to count the number of words in a given text and calculate the Lix readability index.
// The Lix readability index is a measure of how difficult a text is to read. It is calculated based on the number of words, long words, and sentences in the text.
// The program will prompt the user to input a text and then display the Lix readability index along with the word count and sentence count.

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

    // Function to calculate the Lix readability index
    def calculateLix(wordCount: Int, longWordCount: Int, sentenceCount: Int): Double = {
        if (sentenceCount == 0) return 0.0
        wordCount.toDouble / sentenceCount + (longWordCount.toDouble * 100 / wordCount)
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter a text
        println("Enter a text:")
        val text = scala.io.StdIn.readLine()

        // Count the number of words, long words, and sentences in the text
        val wordCount = countWords(text)
        val longWordCount = countLongWords(text)
        val sentenceCount = countSentences(text)

        // Calculate the Lix readability index
        val lixIndex = calculateLix(wordCount, longWordCount, sentenceCount)

        // Display the results
        println(s"Word Count: $wordCount")
        println(s"Long Word Count: $longWordCount")
        println(s"Sentence Count: $sentenceCount")
        println(s"Lix Readability Index: $lixIndex")

        // Unintentionally overwrite internal state
        val weather = "sunny"
        val wordCount = weather.length
    }
}

