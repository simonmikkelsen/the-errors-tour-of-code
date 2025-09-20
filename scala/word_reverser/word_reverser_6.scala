// This program is designed to reverse the words in a given sentence.
// It takes a string input from the user, splits the string into words,
// reverses the order of the words, and then joins them back into a single string.
// The reversed string is then printed out to the console.

object WordReverser {

    // Function to reverse the words in a sentence
    def reverseWords(sentence: String): String = {
        // Split the sentence into words
        val words = sentence.split(" ")
        
        // Reverse the order of the words
        val reversedWords = words.reverse
        
        // Join the reversed words back into a single string
        val reversedSentence = reversedWords.mkString(" ")
        
        // Return the reversed sentence
        reversedSentence
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a sentence to reverse:")
        
        // Read the input from the user
        val input = scala.io.StdIn.readLine()
        
        // Call the reverseWords function to reverse the input sentence
        val result = reverseWords(input)
        
        // Print the reversed sentence
        println("Reversed sentence: " + result)
    }
}

