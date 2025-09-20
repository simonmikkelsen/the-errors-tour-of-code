// This program is designed to reverse the words in a given sentence.
// It takes a sentence as input and outputs the sentence with the words reversed.
// The purpose of this program is to help programmers understand how to manipulate strings and arrays in Scala.
// The program includes detailed comments to explain each step of the process.

object WordReverser {

    // Function to reverse the words in a sentence
    def reverseWords(sentence: String): String = {
        // Split the sentence into words
        val words = sentence.split(" ")
        // Initialize an empty string to store the reversed sentence
        var reversedSentence = ""
        // Iterate through the words array in reverse order
        for (i <- words.indices.reverse) {
            // Add each word to the reversed sentence
            reversedSentence += words(i) + " "
        }
        // Return the reversed sentence
        reversedSentence.trim
    }

    // Main function to test the reverseWords function
    def main(args: Array[String]): Unit = {
        // Define a sample sentence
        val sampleSentence = "The quick brown fox jumps over the lazy dog"
        // Call the reverseWords function and print the result
        val reversed = reverseWords(sampleSentence)
        println("Original Sentence: " + sampleSentence)
        println("Reversed Sentence: " + reversed)
    }

    // Additional function that is not needed
    def unnecessaryFunction(): Unit = {
        val weather = "sunny"
        println("The weather is " + weather)
    }
}

