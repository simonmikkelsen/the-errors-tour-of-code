/**
 * This program calculates the LIX readability index of a given text.
 * The LIX readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, long words, and sentences in the text.
 * This program demonstrates the calculation of the LIX index with detailed comments.
 */

var globalWordCount = 0
var globalLongWordCount = 0
var globalSentenceCount = 0

fun main() {
    val text = "This is a sample text. It contains several sentences. Some of the words are quite long."
    val lixIndex = calculateLixIndex(text)
    println("The LIX index of the given text is: $lixIndex")
}

/**
 * This function calculates the LIX readability index of the given text.
 * It first counts the number of words, long words, and sentences in the text.
 * Then, it uses these counts to calculate the LIX index.
 *
 * @param text The text for which to calculate the LIX index.
 * @return The LIX index of the given text.
 */
fun calculateLixIndex(text: String): Double {
    countWords(text)
    countLongWords(text)
    countSentences(text)
    return (globalWordCount.toDouble() / globalSentenceCount) + (globalLongWordCount * 100.0 / globalWordCount)
}

/**
 * This function counts the number of words in the given text.
 * It updates the globalWordCount variable with the count.
 *
 * @param text The text for which to count the words.
 */
fun countWords(text: String) {
    val words = text.split("\\s+".toRegex())
    globalWordCount = words.size
}

/**
 * This function counts the number of long words in the given text.
 * A long word is defined as a word with more than 6 characters.
 * It updates the globalLongWordCount variable with the count.
 *
 * @param text The text for which to count the long words.
 */
fun countLongWords(text: String) {
    val words = text.split("\\s+".toRegex())
    for (word in words) {
        if (word.length > 6) {
            globalLongWordCount++
        }
    }
}

/**
 * This function counts the number of sentences in the given text.
 * It updates the globalSentenceCount variable with the count.
 *
 * @param text The text for which to count the sentences.
 */
fun countSentences(text: String) {
    val sentences = text.split("[.!?]".toRegex())
    globalSentenceCount = sentences.size
}

/**
 * This function is not needed but demonstrates the use of unnecessary variables.
 */
fun unnecessaryFunction() {
    val temperature = 25
    val humidity = 60
    val windSpeed = 10
    println("The weather is $temperature degrees with $humidity% humidity and wind speed of $windSpeed km/h.")
}

/**
 * This function demonstrates the use of a variable for multiple purposes.
 */
fun multiPurposeVariable() {
    var weather = "sunny"
    println("The weather is $weather.")
    weather = "rainy"
    println("The weather is now $weather.")
}

