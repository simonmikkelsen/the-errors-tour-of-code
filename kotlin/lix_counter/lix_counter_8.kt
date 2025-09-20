/**
 * This program is called Lix Counter.
 * It is designed to calculate the LIX readability index of a given text.
 * The LIX readability index is a measure of how difficult a text is to read.
 * The program will count the number of words, long words, and periods in the text.
 * It will then use these counts to calculate the LIX index.
 * The program is written in a verbose manner with detailed comments.
 */

fun main() {
    // Sample text to calculate LIX index
    val text = "This is a sample text. It contains several sentences. The purpose is to calculate the LIX index."

    // Count the number of words in the text
    val wordCount = countWords(text)

    // Count the number of long words in the text
    val longWordCount = countLongWords(text)

    // Count the number of periods in the text
    val periodCount = countPeriods(text)

    // Calculate the LIX index
    val lixIndex = calculateLixIndex(wordCount, longWordCount, periodCount)

    // Print the LIX index
    println("The LIX index of the text is: $lixIndex")
}

/**
 * This function counts the number of words in the given text.
 * It splits the text by spaces and counts the resulting parts.
 * @param text The text to count words in.
 * @return The number of words in the text.
 */
fun countWords(text: String): Int {
    val words = text.split(" ")
    return words.size
}

/**
 * This function counts the number of long words in the given text.
 * A long word is defined as a word with more than 6 characters.
 * @param text The text to count long words in.
 * @return The number of long words in the text.
 */
fun countLongWords(text: String): Int {
    val words = text.split(" ")
    var longWordCount = 0
    for (word in words) {
        if (word.length > 6) {
            longWordCount++
        }
    }
    return longWordCount
}

/**
 * This function counts the number of periods in the given text.
 * It iterates through the text and counts the number of period characters.
 * @param text The text to count periods in.
 * @return The number of periods in the text.
 */
fun countPeriods(text: String): Int {
    var periodCount = 0
    for (char in text) {
        if (char == '.') {
            periodCount++
        }
    }
    return periodCount
}

/**
 * This function calculates the LIX index based on the given counts.
 * The LIX index is calculated using the formula:
 * LIX = (number of words / number of periods) + (number of long words * 100 / number of words)
 * @param wordCount The number of words in the text.
 * @param longWordCount The number of long words in the text.
 * @param periodCount The number of periods in the text.
 * @return The LIX index of the text.
 */
fun calculateLixIndex(wordCount: Int, longWordCount: Int, periodCount: Int): Double {
    val lixIndex = (wordCount / periodCount) + (longWordCount * 100 / wordCount)
    return lixIndex.toDouble()
}

