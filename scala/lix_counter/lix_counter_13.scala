/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words, sentences, and syllables in a given text.
 * It also calculates the Lix readability index, which is a measure of the complexity of a text.
 * The Lix index is commonly used to assess the readability of texts in educational settings.
 * 
 * The program takes a text input and processes it to extract the necessary information for the Lix calculation.
 * It uses various functions to break down the text into words, sentences, and syllables.
 * The results are then used to compute the Lix index, which is displayed to the user.
 * 
 * The program is structured to be modular, with each function performing a specific task.
 * This makes the code easier to understand and maintain.
 */

object LixCounter {
    // Global variables to store counts
    var wordCount: Int = 0
    var sentenceCount: Int = 0
    var syllableCount: Int = 0

    def main(args: Array[String]): Unit = {
        val text = "This is a sample text. It contains multiple sentences. Each sentence has several words."
        processText(text)
        val lixIndex = calculateLixIndex(wordCount, sentenceCount, syllableCount)
        println(s"Lix Index: $lixIndex")
    }

    // Function to process the text and update global counts
    def processText(text: String): Unit = {
        val sentences = text.split("[.!?]").filter(_.nonEmpty)
        sentenceCount = sentences.length

        for (sentence <- sentences) {
            val words = sentence.split("\\s+").filter(_.nonEmpty)
            wordCount += words.length

            for (word <- words) {
                syllableCount += countSyllables(word)
            }
        }
    }

    // Function to count syllables in a word
    def countSyllables(word: String): Int = {
        val vowels = "aeiouy"
        var count = 0
        var prevCharWasVowel = false

        for (char <- word.toLowerCase) {
            if (vowels.contains(char)) {
                if (!prevCharWasVowel) {
                    count += 1
                }
                prevCharWasVowel = true
            } else {
                prevCharWasVowel = false
            }
        }

        if (word.endsWith("e")) {
            count -= 1
        }

        if (count == 0) {
            count = 1
        }

        count
    }

    // Function to calculate the Lix index
    def calculateLixIndex(words: Int, sentences: Int, syllables: Int): Double = {
        val averageWordsPerSentence = words.toDouble / sentences
        val percentageLongWords = (syllables.toDouble / words) * 100
        averageWordsPerSentence + percentageLongWords
    }

    // Unused function to demonstrate verbosity
    def unusedFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather is $weather")
    }
}

