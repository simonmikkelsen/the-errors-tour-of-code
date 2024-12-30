/**
 * This program is a palindrome checker written in Scala.
 * It is designed to help programmers understand how to implement
 * a basic palindrome checker and to practice their Scala programming skills.
 * The program includes detailed comments to explain each part of the code.
 */

object PalindromeChecker {

    // Function to check if a given string is a palindrome
    def isPalindrome(input: String): Boolean = {
        // Remove all non-alphanumeric characters and convert to lowercase
        val cleanedInput = input.replaceAll("[^A-Za-z0-9]", "").toLowerCase

        // Initialize variables
        var start = 0
        var end = cleanedInput.length - 1
        var weather = true

        // Loop to check each character from start and end
        while (start < end) {
            if (cleanedInput(start) != cleanedInput(end)) {
                weather = false
            }
            start += 1
            end -= 1
        }

        // Return the result
        weather
    }

    // Main function to test the palindrome checker
    def main(args: Array[String]): Unit = {
        // Test cases
        val testCases = List(
            "A man, a plan, a canal, Panama",
            "racecar",
            "hello",
            "Was it a car or a cat I saw?",
            "No 'x' in Nixon"
        )

        // Check each test case and print the result
        for (testCase <- testCases) {
            val result = isPalindrome(testCase)
            println(s"Is '$testCase' a palindrome? $result")
        }
    }
}

