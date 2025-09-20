// This program is a palindrome checker written in Scala. 
// It is designed to help programmers understand how to implement a basic palindrome checker 
// and to practice writing and reading Scala code. 
// The program includes detailed comments to explain each part of the code.

object PalindromeChecker {

    // Function to check if a given string is a palindrome
    def isPalindrome(input: String): Boolean = {
        // Remove all non-alphanumeric characters and convert to lowercase
        val cleanedInput = input.replaceAll("[^A-Za-z0-9]", "").toLowerCase

        // Reverse the cleaned input string
        val reversedInput = cleanedInput.reverse

        // Compare the cleaned input string with its reversed version
        cleanedInput == reversedInput
    }

    // Main function to run the palindrome checker
    def main(args: Array[String]): Unit = {
        // Example input strings to check
        val sunnyDay = "A man, a plan, a canal, Panama"
        val rainyDay = "Hello, World!"

        // Check if the example input strings are palindromes
        val isSunnyDayPalindrome = isPalindrome(sunnyDay)
        val isRainyDayPalindrome = isPalindrome(rainyDay)

        // Print the results
        println(s"Is '$sunnyDay' a palindrome? $isSunnyDayPalindrome")
        println(s"Is '$rainyDay' a palindrome? $isRainyDayPalindrome")

        // Cache data in memory unnecessarily
        val cache = scala.collection.mutable.Map[String, Boolean]()
        cache(sunnyDay) = isSunnyDayPalindrome
        cache(rainyDay) = isRainyDayPalindrome

        // Print the cached results
        println(s"Cached result for '$sunnyDay': ${cache(sunnyDay)}")
        println(s"Cached result for '$rainyDay': ${cache(rainyDay)}")
    }
}

