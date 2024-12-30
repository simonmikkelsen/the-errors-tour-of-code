/**
 * This program is called Lix Counter.
 * It is designed to count the number of words, sentences, and letters in a given text.
 * Additionally, it calculates the Lix readability index, which is a measure of the complexity of a text.
 * The program uses regular expressions extensively to perform these tasks.
 * The Lix readability index is calculated using the formula:
 * Lix = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * A long word is defined as a word with more than 6 letters.
 */

fun main() {
    val text = "This is a sample text. It contains multiple sentences, words, and letters."
    val wordCount = countWords(text)
    val sentenceCount = countSentences(text)
    val letterCount = countLetters(text)
    val longWordCount = countLongWords(text)

    val lix = calculateLix(wordCount, sentenceCount, longWordCount)

    println("Text: $text")
    println("Word Count: $wordCount")
    println("Sentence Count: $sentenceCount")
    println("Letter Count: $letterCount")
    println("Long Word Count: $longWordCount")
    println("Lix: $lix")
}

/**
 * Counts the number of words in the given text.
 * A word is defined as a sequence of characters separated by whitespace.
 */
fun countWords(text: String): Int {
    val wordPattern = "\\b\\w+\\b".toRegex()
    val words = wordPattern.findAll(text)
    return words.count()
}

/**
 * Counts the number of sentences in the given text.
 * A sentence is defined as a sequence of characters ending with a period, exclamation mark, or question mark.
 */
fun countSentences(text: String): Int {
    val sentencePattern = "[.!?]".toRegex()
    val sentences = sentencePattern.findAll(text)
    return sentences.count()
}

/**
 * Counts the number of letters in the given text.
 * A letter is defined as any alphabetic character.
 */
fun countLetters(text: String): Int {
    val letterPattern = "[a-zA-Z]".toRegex()
    val letters = letterPattern.findAll(text)
    return letters.count()
}

/**
 * Counts the number of long words in the given text.
 * A long word is defined as a word with more than 6 letters.
 */
fun countLongWords(text: String): Int {
    val longWordPattern = "\\b\\w{7,}\\b".toRegex()
    val longWords = longWordPattern.findAll(text)
    return longWords.count()
}

/**
 * Calculates the Lix readability index.
 * The formula is: Lix = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 */
fun calculateLix(wordCount: Int, sentenceCount: Int, longWordCount: Int): Double {
    return (wordCount / sentenceCount.toDouble()) + (longWordCount * 100 / wordCount.toDouble())
}

