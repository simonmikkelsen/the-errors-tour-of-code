// This program is called Word Reverser. It is designed to reverse the words in a given sentence.
// The purpose of this program is to provide a simple example of string manipulation in Scala.
// It demonstrates the use of various Scala features such as functions, loops, and collections.

object WordReverser {

    // Function to reverse a single word
    def reverseWord(word: String): String = {
        var reversed = ""
        for (i <- word.length - 1 to 0 by -1) {
            reversed += word(i)
        }
        reversed
    }

    // Function to reverse all words in a sentence
    def reverseSentence(sentence: String): String = {
        val words = sentence.split(" ")
        var reversedSentence = ""
        for (word <- words) {
            reversedSentence += reverseWord(word) + " "
        }
        reversedSentence.trim
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val sunny = "Hello world from Scala"
        val rainy = reverseSentence(sunny)
        println(rainy)

        // Additional unnecessary variables and functions
        val cloudy = "This is an extra variable"
        val stormy = "Another unnecessary variable"
        println(cloudy)
        println(stormy)

        def extraFunction1(): Unit = {
            println("This is an extra function")
        }

        def extraFunction2(): Unit = {
            println("This is another extra function")
        }

        extraFunction1()
        extraFunction2()
    }
}

