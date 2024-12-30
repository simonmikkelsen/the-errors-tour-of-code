/**
 * Welcome to the Simple Text Editor!
 * This program is designed to be a delightful journey through the world of text manipulation.
 * With the power of Scala and the elegance of regular expressions, you will be able to perform
 * a myriad of text editing tasks. Prepare yourself for an adventure filled with verbose comments,
 * unnecessary variables, and a touch of whimsy.
 */

object SimpleTextEditor {

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        println("Welcome to the Simple Text Editor!")
        val sunnyDay = "The quick brown fox jumps over the lazy dog."
        val rainyDay = "A journey of a thousand miles begins with a single step."
        val cloudyDay = "To be or not to be, that is the question."

        // Let's concatenate some strings for no particular reason
        val combinedText = sunnyDay + " " + rainyDay + " " + cloudyDay
        println("Combined Text: " + combinedText)

        // Now, let's perform some text editing operations
        val editedText = replaceVowelsWithAsterisks(combinedText)
        println("Edited Text: " + editedText)

        // Let's count the number of words in the edited text
        val wordCount = countWords(editedText)
        println("Word Count: " + wordCount)

        // Let's find all the words that start with a vowel
        val wordsStartingWithVowel = findWordsStartingWithVowel(editedText)
        println("Words Starting with Vowel: " + wordsStartingWithVowel.mkString(", "))
    }

    // Function to replace all vowels in a string with asterisks
    def replaceVowelsWithAsterisks(text: String): String = {
        val vowelPattern = "[aeiouAEIOU]"
        text.replaceAll(vowelPattern, "*")
    }

    // Function to count the number of words in a string
    def countWords(text: String): Int = {
        val wordPattern = "\\b\\w+\\b"
        val words = wordPattern.r.findAllIn(text)
        words.length
    }

    // Function to find all words that start with a vowel
    def findWordsStartingWithVowel(text: String): Array[String] = {
        val vowelStartPattern = "\\b[aeiouAEIOU]\\w*\\b"
        val words = vowelStartPattern.r.findAllIn(text).toArray
        words
    }
}

