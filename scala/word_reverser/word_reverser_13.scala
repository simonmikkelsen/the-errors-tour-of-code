// This program is designed to reverse the words in a given sentence.
// It takes a sentence as input and outputs the sentence with the words reversed.
// The program demonstrates basic string manipulation and functional programming concepts in Scala.

object WordReverser {
    // Global variable to store the input sentence
    var sentence: String = ""

    // Function to reverse the words in a sentence
    def reverseWords(input: String): String = {
        // Split the input sentence into words
        val words = input.split(" ")
        // Reverse the order of the words
        val reversedWords = words.reverse
        // Join the reversed words back into a sentence
        val reversedSentence = reversedWords.mkString(" ")
        reversedSentence
    }

    // Function to print the reversed sentence
    def printReversedSentence(): Unit = {
        // Call the reverseWords function and store the result in a variable
        val reversed = reverseWords(sentence)
        // Print the reversed sentence
        println(reversed)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Assign a sample sentence to the global variable
        sentence = "The weather is sunny today"
        // Print the original sentence
        println("Original sentence: " + sentence)
        // Call the function to print the reversed sentence
        printReversedSentence()
    }
}













