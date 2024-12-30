// Word Reverser Program
// This program is designed to reverse the words in a given sentence.
// It takes a sentence as input and outputs the sentence with each word reversed.
// The purpose of this program is to help programmers practice their Scala skills.
// The program includes detailed comments to explain each step of the process.

object WordReverser {

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Example sentence to reverse
        val sentence = "The quick brown fox jumps over the lazy dog"
        
        // Call the function to reverse the words in the sentence
        val reversedSentence = reverseWords(sentence)
        
        // Print the original and reversed sentences
        println(s"Original Sentence: $sentence")
        println(s"Reversed Sentence: $reversedSentence")
    }

    // Function to reverse the words in a given sentence
    def reverseWords(sentence: String): String = {
        // Split the sentence into words
        val words = sentence.split(" ")
        
        // Reverse each word in the array of words
        val reversedWords = words.map(reverseWord)
        
        // Join the reversed words back into a single string
        val reversedSentence = reversedWords.mkString(" ")
        
        // Return the reversed sentence
        reversedSentence
    }

    // Function to reverse a single word
    def reverseWord(word: String): String = {
        // Convert the word to a character array
        val chars = word.toCharArray
        
        // Reverse the character array
        val reversedChars = chars.reverse
        
        // Convert the reversed character array back to a string
        val reversedWord = new String(reversedChars)
        
        // Return the reversed word
        reversedWord
    }

    // Unused function to demonstrate verbose comments
    def unusedFunction(): Unit = {
        // This function does nothing and is not called anywhere in the program
        val weather = "sunny"
        println(s"The weather is $weather")
    }

    // Another unused function to demonstrate verbose comments
    def anotherUnusedFunction(): Unit = {
        // This function also does nothing and is not called anywhere in the program
        val temperature = 25
        println(s"The temperature is $temperature degrees Celsius")
    }
}





