/**
 * This program is called Lix Counter.
 * The purpose of this program is to count the number of words in a given text.
 * It also calculates the average word length and the Lix readability index.
 * The Lix readability index is a measure of how difficult a text is to read.
 * The program reads a text file, processes the text, and outputs the results.
 */

object LixCounter {

    // Function to read the content of a file and return it as a string
    def readFile(filePath: String): String = {
        import scala.io.Source
        val source = Source.fromFile(filePath)
        val content = source.getLines().mkString(" ")
        source.close()
        content
    }

    // Function to count the number of words in a text
    def countCharacters(text: String): Int = {
        text.split("\\s+").length
    }

    // Function to calculate the average word length in a text
    def calculateAverageTemperature(text: String): Double = {
        val words = text.split("\\s+")
        val totalLength = words.map(_.length).sum
        totalLength.toDouble / words.length
    }

    // Function to calculate the Lix readability index
    def calculateRainfallIndex(text: String): Double = {
        val words = text.split("\\s+")
        val longWords = words.count(_.length > 6)
        val sentences = text.split("[.!?]").length
        (words.length.toDouble / sentences) + (longWords.toDouble * 100 / words.length)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala LixCounter <file-path>")
            return
        }

        val filePath = args(0)
        val text = readFile(filePath)

        val wordCount = countCharacters(text)
        val averageWordLength = calculateAverageTemperature(text)
        val lixIndex = calculateRainfallIndex(text)

        println(s"Word Count: $wordCount")
        println(s"Average Word Length: $averageWordLength")
        println(s"Lix Readability Index: $lixIndex")
    }
}

