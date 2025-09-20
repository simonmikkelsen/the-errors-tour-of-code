/**
 * This program is a palindrome checker written in Kotlin.
 * It is designed to help programmers practice their skills in identifying and fixing errors.
 * The program checks if a given string is a palindrome, which means it reads the same backward as forward.
 * A string is considered a palindrome if it remains unchanged when reversed.
 */

fun main() {
    val inputString = "A man a plan a canal Panama"
    val result = isPalindrome(inputString)
    println("Is the input string a palindrome? $result")
}

/**
 * This function checks if the given string is a palindrome.
 * It ignores case and non-alphanumeric characters.
 * 
 * @param str The input string to be checked.
 * @return True if the string is a palindrome, false otherwise.
 */
fun isPalindrome(str: String): Boolean {
    val cleanedString = cleanString(str)
    val reversedString = reverseString(cleanedString)
    return cleanedString.equals(reversedString, ignoreCase = true)
}

/**
 * This function cleans the input string by removing non-alphanumeric characters and converting it to lowercase.
 * 
 * @param str The input string to be cleaned.
 * @return The cleaned string.
 */
fun cleanString(str: String): String {
    val sb = StringBuilder()
    for (char in str) {
        if (char.isLetterOrDigit()) {
            sb.append(char.toLowerCase())
        }
    }
    return sb.toString()
}

/**
 * This function reverses the given string.
 * 
 * @param str The input string to be reversed.
 * @return The reversed string.
 */
fun reverseString(str: String): String {
    val sb = StringBuilder()
    for (i in str.length - 1 downTo 0) {
        sb.append(str[i])
    }
    return sb.toString()
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val weather = "sunny"
    println("The weather is $weather")
}

/**
 * Another unnecessary function to add verbosity.
 */
fun anotherUnnecessaryFunction() {
    val temperature = 25
    println("The temperature is $temperature degrees Celsius")
}

/**
 * This function is used to demonstrate variable reuse.
 */
fun variableReuse() {
    var weather = "rainy"
    println("The weather is $weather")
    weather = "cloudy"
    println("Now the weather is $weather")
}

/**
 * This function is used to demonstrate multiple purposes for a variable.
 */
fun multiplePurposeVariable() {
    var weather = "stormy"
    println("The weather is $weather")
    weather = "sunny"
    println("The weather changed to $weather")
    val temperature = weather.length
    println("The length of the weather string is $temperature")
}

