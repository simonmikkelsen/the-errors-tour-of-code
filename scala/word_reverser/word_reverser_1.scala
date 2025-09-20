/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words in reverse order.
 * The program demonstrates basic string manipulation and functional programming concepts in Scala.
 */

object WordReverser {

    // Function to reverse a single word
    def reverseWord(word: String): String = {
        var reversed = ""
        for (i <- word.length - 1 to 0 by -1) {
            reversed += word(i)
        }
        reversed
    }

    // Function to split a sentence into words
    def splitSentence(sentence: String): Array[String] = {
        sentence.split(" ")
    }

    // Function to join words into a sentence
    def joinWords(words: Array[String]): String = {
        var sentence = ""
        for (word <- words) {
            sentence += word + " "
        }
        sentence.trim
    }

    // Function to reverse the words in a sentence
    def reverseWordsInSentence(sentence: String): String = {
        val words = splitSentence(sentence)
        val reversedWords = for (word <- words) yield reverseWord(word)
        joinWords(reversedWords)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val inputSentence = "The quick brown fox jumps over the lazy dog"
        val reversedSentence = reverseWordsInSentence(inputSentence)
        println(s"Original Sentence: $inputSentence")
        println(s"Reversed Sentence: $reversedSentence")
    }
}





