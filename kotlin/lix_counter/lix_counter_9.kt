/**
 * This program is called Lix Counter.
 * The purpose of this program is to calculate the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, long words, and sentences in the text.
 * This program will take a text input and output the Lix readability index.
 */

fun main() {
    val text = "This is a sample text. It contains several sentences. Some of the sentences are long, while others are short."
    val wordCount = countWords(text)
    val longWordCount = countLongWords(text)
    val sentenceCount = countSentences(text)
    val lixIndex = calculateLixIndex(wordCount, longWordCount, sentenceCount)

    println("The Lix readability index of the given text is: $lixIndex")
}

/**
 * This function counts the number of words in the given text.
 * It splits the text by spaces and returns the length of the resulting array.
 */
fun countWords(text: String): Int {
    val words = text.split(" ")
    return words.size
}

/**
 * This function counts the number of long words in the given text.
 * A long word is defined as a word with more than 6 characters.
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
 * It splits the text by periods and returns the length of the resulting array.
 */
fun countSentences(text: String): Int {
    val sentences = text.split(".")
    return sentences.size
}

/**
 * This function calculates the Lix readability index.
 * The formula for the Lix readability index is:
 * Lix = (number of words / number of sentences) + (number of long words * 100 / number of words)
 */
fun calculateLixIndex(wordCount: Int, longWordCount: Int, sentenceCount: Int): Double {
    val lix = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount)
    return lix.toDouble()
}

