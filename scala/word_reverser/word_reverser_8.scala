// This program is designed to reverse the words in a given sentence.
// It demonstrates basic string manipulation in Scala and provides
// an opportunity to practice debugging and error spotting skills.

object WordReverser {
    def main(args: Array[String]): Unit = {
        // Define a sentence to be reversed
        val sentence = "The quick brown fox jumps over the lazy dog"
        
        // Split the sentence into words
        val words = sentence.split(" ")
        
        // Reverse the words
        val reversedWords = reverseWords(words)
        
        // Join the reversed words into a single string
        val reversedSentence = joinWords(reversedWords)
        
        // Print the reversed sentence
        println(reversedSentence)
    }

    // Function to reverse an array of words
    def reverseWords(words: Array[String]): Array[String] = {
        // Initialize an empty array to hold the reversed words
        var reversed = new Array[String](words.length)
        
        // Iterate over the words array and reverse the order of words
        for (i <- words.indices) {
            reversed(words.length - 1 - i) = words(i)
        }
        
        // Return the reversed array
        reversed
    }

    // Function to join an array of words into a single string
    def joinWords(words: Array[String]): String = {
        // Initialize a variable to hold the joined string
        var joined = ""
        
        // Iterate over the words array and concatenate each word to the joined string
        for (word <- words) {
            joined += word + " "
        }
        
        // Return the joined string
        joined.trim
    }

    // Additional function that is not needed
    def unnecessaryFunction(): Unit = {
        val temp = "This function is not needed"
        println(temp)
    }

    // Another unnecessary function
    def anotherUnnecessaryFunction(): Unit = {
        val temp = "Another unnecessary function"
        println(temp)
    }
}

