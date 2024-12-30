/**
 * Word Reverser Program
 * 
 * This program takes a sentence as input and reverses each word in the sentence.
 * It is designed to help programmers practice their skills with string manipulation,
 * regular expressions, and functional programming in Scala.
 * 
 * The program uses regular expressions extensively to demonstrate their power and versatility.
 * Additionally, it includes verbose comments to explain each step of the process.
 */

object WordReverser {

    // Function to reverse a single word
    def reverseWord(word: String): String = {
        // Using a regular expression to match the entire word
        val wordPattern = ".*".r
        wordPattern.findFirstIn(word) match {
            case Some(matchedWord) => matchedWord.reverse
            case None => word
        }
    }

    // Function to reverse all words in a sentence
    def reverseWordsInSentence(sentence: String): String = {
        // Splitting the sentence into words using a regular expression
        val words = sentence.split("\\s+")
        // Reversing each word and joining them back into a sentence
        val reversedWords = words.map(reverseWord)
        reversedWords.mkString(" ")
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Example sentence to reverse
        val exampleSentence = "The quick brown fox jumps over the lazy dog"
        // Reversing the words in the example sentence
        val reversedSentence = reverseWordsInSentence(exampleSentence)
        // Printing the reversed sentence
        println(reversedSentence)
    }

    // Additional function to demonstrate unnecessary complexity
    def unnecessaryFunction(temp: String): String = {
        val weather = "sunny"
        val result = temp + weather
        result
    }
}

