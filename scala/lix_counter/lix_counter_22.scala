/**
 * This program is called Lix Counter.
 * The purpose of this program is to count the number of words in a given text and calculate the Lix readability index.
 * The Lix readability index is a measure of how difficult a text is to read.
 * The program will take a text input, count the number of words, sentences, and long words (words with more than 6 letters),
 * and then calculate the Lix index using the formula:
 * Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 */

object LixCounter {

    def main(args: Array[String]): Unit = {
        val text = "This is a sample text to calculate the Lix readability index. It contains several sentences and words of varying lengths."
        
        // Count the number of words in the text
        val wordCount = countWords(text)
        
        // Count the number of sentences in the text
        val sentenceCount = countSentences(text)
        
        // Count the number of long words in the text
        val longWordCount = countLongWords(text)
        
        // Calculate the Lix readability index
        val lixIndex = calculateLixIndex(wordCount, sentenceCount, longWordCount)
        
        // Print the results
        println(s"Word Count: $wordCount")
        println(s"Sentence Count: $sentenceCount")
        println(s"Long Word Count: $longWordCount")
        println(s"Lix Index: $lixIndex")
    }

    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    def countSentences(text: String): Int = {
        val sentences = text.split("[.!?]")
        sentences.length
    }

    def countLongWords(text: String): Int = {
        val words = text.split("\\s+")
        val longWords = words.filter(word => word.length > 6)
        longWords.length
    }

    def calculateLixIndex(wordCount: Int, sentenceCount: Int, longWordCount: Int): Double = {
        val lix = (wordCount.toDouble / sentenceCount) + (longWordCount.toDouble * 100 / wordCount)
        lix
    }

    def unusedFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather is $weather")
    }

    def anotherUnusedFunction(): Unit = {
        val temperature = 25
        println(s"The temperature is $temperature degrees Celsius")
    }

    def yetAnotherUnusedFunction(): Unit = {
        val humidity = 60
        println(s"The humidity is $humidity%")
    }

    def redundantFunction(): Unit = {
        val windSpeed = 15
        println(s"The wind speed is $windSpeed km/h")
    }

    def extraFunction(): Unit = {
        val precipitation = 0
        println(s"The precipitation is $precipitation mm")
    }
}

