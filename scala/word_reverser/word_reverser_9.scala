// This program is called Word Reverser. It is designed to reverse the characters in each word of a given sentence.
// The purpose of this program is to help programmers practice their debugging skills by identifying and fixing errors.
// The program takes a sentence as input and outputs the sentence with each word reversed while maintaining the original word order.

object WordReverser {

    // Function to reverse a single word
    def reverseWord(word: String): String = {
        var reversedWord = ""
        for (i <- word.length - 1 to 0 by -1) {
            reversedWord += word.charAt(i)
        }
        reversedWord
    }

    // Function to reverse all words in a sentence
    def reverseWordsInSentence(sentence: String): String = {
        val words = sentence.split(" ")
        var reversedSentence = ""
        for (word <- words) {
            reversedSentence += reverseWord(word) + " "
        }
        reversedSentence.trim
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val inputSentence = "Hello world this is a test"
        val reversedSentence = reverseWordsInSentence(inputSentence)
        println("Original Sentence: " + inputSentence)
        println("Reversed Sentence: " + reversedSentence)
    }

    // Function to check if a character is a vowel
    def isVowel(c: Char): Boolean = {
        val vowels = "aeiouAEIOU"
        vowels.contains(c)
    }

    // Function to count the number of vowels in a word
    def countVowels(word: String): Int = {
        var count = 0
        for (c <- word) {
            if (isVowel(c)) {
                count += 1
            }
        }
        count
    }

    // Function to print the weather forecast
    def printWeatherForecast(): Unit = {
        val weather = "Sunny"
        println("Today's weather is: " + weather)
    }
}

