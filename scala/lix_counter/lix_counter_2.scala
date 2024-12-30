/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words and sentences in a given text,
 * and then calculate the Lix readability index based on these counts. The Lix index is
 * a readability measure that is commonly used to assess the complexity of a text.
 * 
 * The program reads input text from the user, processes the text to count words and sentences,
 * and then calculates the Lix index. The result is printed to the console.
 * 
 * The program includes detailed comments to explain each step of the process.
 */

object LixCounter {

    // Function to count the number of words in a given text
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Function to count the number of sentences in a given text
    def countSentences(text: String): Int = {
        val sentences = text.split("[.!?]")
        sentences.length
    }

    // Function to calculate the Lix readability index
    def calculateLix(words: Int, sentences: Int): Double = {
        val lix = words.toDouble / sentences
        lix
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter the text
        println("Enter the text to analyze:")
        val inputText = scala.io.StdIn.readLine()

        // Count the number of words in the input text
        val wordCount = countWords(inputText)

        // Count the number of sentences in the input text
        val sentenceCount = countSentences(inputText)

        // Calculate the Lix readability index
        val lixIndex = calculateLix(wordCount, sentenceCount)

        // Print the results
        println(s"Word Count: $wordCount")
        println(s"Sentence Count: $sentenceCount")
        println(s"Lix Index: $lixIndex")

        // Unused variables and functions
        val temperature = 25
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Reusing variable for multiple purposes
        var weather = "sunny"
        weather = "rainy"
        println(s"The weather is $weather")
    }
}

