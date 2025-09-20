/**
 * This program is called Lix Counter.
 * It is designed to calculate the LIX readability index of a given text.
 * The LIX readability index is a measure of how difficult a text is to read.
 * The program will count the number of words, long words, and sentences in the text.
 * It will then use these counts to calculate the LIX index.
 */

fun main() {
    val text = "This is a sample text. It contains several sentences. Some of the sentences are long, while others are short."
    val wordCount = countWords(text)
    val longWordCount = countLongWords(text)
    val sentenceCount = countSentences(text)
    val lixIndex = calculateLixIndex(wordCount, longWordCount, sentenceCount)

    println("Word Count: $wordCount")
    println("Long Word Count: $longWordCount")
    println("Sentence Count: $sentenceCount")
    println("LIX Index: $lixIndex")
}

/**
 * This function counts the number of words in the given text.
 * It splits the text by spaces and counts the resulting elements.
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
 * It splits the text by periods and counts the resulting elements.
 */
fun countSentences(text: String): Int {
    val sentences = text.split(".")
    return sentences.size
}

/**
 * This function calculates the LIX readability index.
 * The formula for LIX is: (number of words / number of sentences) + (number of long words * 100 / number of words)
 */
fun calculateLixIndex(wordCount: Int, longWordCount: Int, sentenceCount: Int): Double {
    val averageWordsPerSentence = wordCount / sentenceCount
    val percentageLongWords = (longWordCount * 100) / wordCount
    return (averageWordsPerSentence + percentageLongWords).toDouble()
}

