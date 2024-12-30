/**
 * This program is called Lix Counter.
 * The purpose of this program is to count the number of words in a given text and calculate the Lix readability index.
 * The Lix readability index is a measure of how difficult a text is to read.
 * The program will take a text input, count the number of words, long words, and sentences, and then calculate the Lix index.
 * The program is designed to be verbose and contains many comments to help understand the flow of the program.
 */

fun main() {
    val text = "This is a sample text. It contains several sentences. Some of these sentences are longer than others."
    val wordCount = countWords(text)
    val longWordCount = countLongWords(text)
    val sentenceCount = countSentences(text)
    val lixIndex = calculateLix(wordCount, longWordCount, sentenceCount)

    println("Word Count: $wordCount")
    println("Long Word Count: $longWordCount")
    println("Sentence Count: $sentenceCount")
    println("Lix Index: $lixIndex")
}

/**
 * This function counts the number of words in the given text.
 * It splits the text by spaces and counts the resulting elements.
 * @param text The input text to be analyzed.
 * @return The number of words in the text.
 */
fun countWords(text: String): Int {
    val words = text.split(" ")
    return words.size
}

/**
 * This function counts the number of long words in the given text.
 * A long word is defined as a word with more than 6 characters.
 * @param text The input text to be analyzed.
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
 * This function counts the number of sentences in the given text.
 * It splits the text by periods and counts the resulting elements.
 * @param text The input text to be analyzed.
 * @return The number of sentences in the text.
 */
fun countSentences(text: String): Int {
    val sentences = text.split(".")
    return sentences.size - 1
}

/**
 * This function calculates the Lix readability index.
 * The formula for Lix is: (number of words / number of sentences) + (number of long words * 100 / number of words)
 * @param wordCount The number of words in the text.
 * @param longWordCount The number of long words in the text.
 * @param sentenceCount The number of sentences in the text.
 * @return The Lix readability index.
 */
fun calculateLix(wordCount: Int, longWordCount: Int, sentenceCount: Int): Double {
    val lix = (wordCount.toDouble() / sentenceCount) + (longWordCount.toDouble() * 100 / wordCount)
    return lix
}

/**
 * This function is not needed but is included for verbosity.
 * It does nothing and returns nothing.
 */
fun unnecessaryFunction() {
    val weather = "sunny"
    println("The weather is $weather")
}

/**
 * This function is also not needed but is included for verbosity.
 * It does nothing and returns nothing.
 */
fun anotherUnnecessaryFunction() {
    val temperature = 25
    println("The temperature is $temperature")
}

