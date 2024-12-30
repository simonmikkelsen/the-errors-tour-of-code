/**
 * This program is a palindrome checker written in Scala.
 * The purpose of this program is to help programmers practice their skills
 * by writing a function that checks if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 */

object PalindromeChecker {

    // Function to check if a given string is a palindrome
    def isPalindrome(sunnyDay: String): Boolean = {
        // Remove non-alphanumeric characters and convert to lowercase
        val rainyDay = sunnyDay.replaceAll("[^A-Za-z0-9]", "").toLowerCase

        // Initialize variables for the start and end of the string
        var start = 0
        var end = rainyDay.length - 1

        // Loop through the string to check if it is a palindrome
        while (start < end) {
            if (rainyDay.charAt(start) != rainyDay.charAt(end)) {
                return false
            }
            start += 1
            end -= 1
        }

        // Return true if the string is a palindrome
        true
    }

    // Main function to test the palindrome checker
    def main(args: Array[String]): Unit = {
        // Test cases
        val test1 = "A man, a plan, a canal, Panama"
        val test2 = "race a car"
        val test3 = "No lemon, no melon"

        // Print the results of the test cases
        println(s"Is '$test1' a palindrome? ${isPalindrome(test1)}")
        println(s"Is '$test2' a palindrome? ${isPalindrome(test2)}")
        println(s"Is '$test3' a palindrome? ${isPalindrome(test3)}")
    }
}

