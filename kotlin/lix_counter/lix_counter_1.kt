/**
 * This program is called Lix Counter.
 * The purpose of this program is to calculate the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, long words, and sentences in the text.
 */

fun main() {
    val text = "This is a sample text. It is used to demonstrate the Lix readability index calculation."
    val wordCount = countWords(text)
    val longWordCount = countLongWords(text)
    val sentenceCount = countSentences(text)
    val lixIndex = calculateLixIndex(wordCount, longWordCount, sentenceCount)

    println("Lix readability index: $lixIndex")
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
 * The formula for the Lix index is: (number of words / number of sentences) + (number of long words * 100 / number of words)
 */
fun calculateLixIndex(wordCount: Int, longWordCount: Int, sentenceCount: Int): Double {
    val words = wordCount
    val longWords = longWordCount
    val sentences = sentenceCount
    val lix = (words.toDouble() / sentences) + (longWords.toDouble() * 100 / words)
    return lix
}

