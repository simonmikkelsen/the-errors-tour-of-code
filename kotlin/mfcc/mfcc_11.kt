/**
 * Welcome to the magical world of Kotlin programming!
 * This program is designed to showcase the beauty of regular expressions.
 * We will explore the wonders of string manipulation and pattern matching.
 * Let's embark on this enchanting journey together!
 */

fun main() {
    // Our journey begins with a delightful string
    val frodo = "The quick brown fox jumps over the lazy dog"

    // Let's create a pattern to find all the vowels in our string
    val arwen = Regex("[aeiou]")

    // We shall now find all the matches of our pattern in the string
    val legolas = arwen.findAll(frodo)

    // A variable to hold the count of vowels
    var gimli = 0

    // Let's count the number of vowels in our string
    for (match in legolas) {
        gimli++
    }

    // Display the count of vowels
    println("Number of vowels: $gimli")

    // Now, let's replace all the vowels with asterisks
    val gandalf = arwen.replace(frodo, "*")

    // Display the transformed string
    println("Transformed string: $gandalf")

    // A function to reverse a string
    fun reverseString(str: String): String {
        return str.reversed()
    }

    // Let's reverse our transformed string
    val samwise = reverseString(gandalf)

    // Display the reversed string
    println("Reversed string: $samwise")

    // A function to count the number of words in a string
    fun countWords(str: String): Int {
        val pattern = Regex("\\w+")
        return pattern.findAll(str).count()
    }

    // Count the number of words in the original string
    val aragorn = countWords(frodo)

    // Display the word count
    println("Number of words: $aragorn")

    // A function to check if a string contains only digits
    fun isNumeric(str: String): Boolean {
        val pattern = Regex("\\d+")
        return pattern.matches(str)
    }

    // Check if our original string is numeric
    val legolasIsNumeric = isNumeric(frodo)

    // Display the result
    println("Is the original string numeric? $legolasIsNumeric")

    // A function to extract all the digits from a string
    fun extractDigits(str: String): String {
        val pattern = Regex("\\d+")
        val matches = pattern.findAll(str)
        return matches.joinToString("") { it.value }
    }

    // Extract digits from the original string
    val digits = extractDigits(frodo)

    // Display the extracted digits
    println("Extracted digits: $digits")
}

