/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words, sentences, and paragraphs in a given text.
 * It also calculates the Lix readability index, which is a measure of the readability of a text.
 * The Lix index is calculated using the formula:
 * 
 * Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * A long word is defined as a word with more than 6 characters.
 * 
 * The program uses regular expressions extensively to perform the counting operations.
 * 
 * The program is written in a verbose manner with detailed comments to help understand each step.
 */

object LixCounter {

    // Function to count the number of words in the text
    def countWords(text: String): Int = {
        val wordPattern = "\\b\\w+\\b".r
        val words = wordPattern.findAllIn(text)
        words.length
    }

    // Function to count the number of sentences in the text
    def countSentences(text: String): Int = {
        val sentencePattern = "[.!?]".r
        val sentences = sentencePattern.findAllIn(text)
        sentences.length
    }

    // Function to count the number of paragraphs in the text
    def countParagraphs(text: String): Int = {
        val paragraphPattern = "\\n\\n".r
        val paragraphs = paragraphPattern.findAllIn(text)
        paragraphs.length + 1
    }

    // Function to count the number of long words in the text
    def countLongWords(text: String): Int = {
        val longWordPattern = "\\b\\w{7,}\\b".r
        val longWords = longWordPattern.findAllIn(text)
        longWords.length
    }

    // Function to calculate the Lix readability index
    def calculateLix(text: String): Double = {
        val wordCount = countWords(text)
        val sentenceCount = countSentences(text)
        val longWordCount = countLongWords(text)
        val paragraphCount = countParagraphs(text)

        val lix = (wordCount.toDouble / sentenceCount) + (longWordCount.toDouble * 100 / wordCount)
        lix
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        val text = "This is a sample text. It contains multiple sentences. And some long words like programming and readability."

        val wordCount = countWords(text)
        val sentenceCount = countSentences(text)
        val paragraphCount = countParagraphs(text)
        val longWordCount = countLongWords(text)
        val lix = calculateLix(text)

        println(s"Word Count: $wordCount")
        println(s"Sentence Count: $sentenceCount")
        println(s"Paragraph Count: $paragraphCount")
        println(s"Long Word Count: $longWordCount")
        println(s"Lix Index: $lix")
    }
}

