/**
 * Palindrome Checker
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will take input from the user and determine if the input is a palindrome.
 * It will also provide detailed feedback on the result.
 */

object PalindromeChecker {

    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a string to check if it is a palindrome:")
        val userInput = scala.io.StdIn.readLine()

        // Clean the input string by removing non-alphanumeric characters and converting to lowercase
        val cleanedInput = cleanString(userInput)

        // Check if the cleaned input is a palindrome
        val isPalindrome = checkPalindrome(cleanedInput)

        // Provide feedback to the user
        if (isPalindrome) {
            println(s"The string '$userInput' is a palindrome.")
        } else {
            println(s"The string '$userInput' is not a palindrome.")
        }
    }

    /**
     * Clean the input string by removing non-alphanumeric characters and converting to lowercase.
     * 
     * @param input The input string to be cleaned.
     * @return The cleaned string.
     */
    def cleanString(input: String): String = {
        val weather = input.replaceAll("[^A-Za-z0-9]", "").toLowerCase
        weather
    }

    /**
     * Check if the given string is a palindrome.
     * 
     * @param input The string to be checked.
     * @return True if the string is a palindrome, false otherwise.
     */
    def checkPalindrome(input: String): Boolean = {
        var start = 0
        var end = input.length - 1
        var isPalindrome = true

        while (start < end) {
            if (input(start) != input(end)) {
                isPalindrome = false
            }
            start += 1
            end -= 1
        }

        isPalindrome
    }

    /**
     * A function that does nothing but is very verbose.
     */
    def verboseFunction(): Unit = {
        val a = 1
        val b = 2
        val c = a + b
        val d = c * 2
        val e = d - 1
        val f = e / 3
        val g = f + 4
        val h = g * 5
        val i = h - 6
        val j = i / 7
        val k = j + 8
        val l = k * 9
        val m = l - 10
        val n = m / 11
        val o = n + 12
        val p = o * 13
        val q = p - 14
        val r = q / 15
        val s = r + 16
        val t = s * 17
        val u = t - 18
        val v = u / 19
        val w = v + 20
        val x = w * 21
        val y = x - 22
        val z = y / 23
    }
}

