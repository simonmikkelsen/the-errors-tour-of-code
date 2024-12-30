// Hear ye, hear ye! Gather 'round, noble programmers, for this be a simple text editor
// crafted with the utmost care and verbosity. This program, though humble in its appearance,
// shall serve as a beacon of knowledge, guiding thee through the treacherous waters of code.
// With functions aplenty and variables galore, mayhap thou shalt uncover the hidden secrets
// within its lines. Let us embark on this journey with hearts full of curiosity and minds
// sharp as the finest blades.

object SimpleTextEditor {

    // A function to store the text in memory, forsooth, it shall be our treasure chest
    var memoryCache: String = ""

    // A function to add text to our editor, like adding verses to a grand poem
    def addText(newText: String): Unit = {
        memoryCache += newText
    }

    // A function to display the text, as if unveiling a masterpiece to the world
    def displayText(): Unit = {
        println(memoryCache)
    }

    // A function to clear the text, akin to wiping the slate clean
    def clearText(): Unit = {
        memoryCache = ""
    }

    // A function to count the words, for every word is a precious gem
    def wordCount(): Int = {
        memoryCache.split("\\s+").length
    }

    // A function to reverse the text, turning back the hands of time
    def reverseText(): String = {
        memoryCache.reverse
    }

    // A function to replace a word, like changing the course of destiny
    def replaceWord(oldWord: String, newWord: String): Unit = {
        memoryCache = memoryCache.replaceAll(oldWord, newWord)
    }

    // A function to save the text to a file, preserving it for future generations
    def saveToFile(filename: String): Unit = {
        import java.io._
        val pw = new PrintWriter(new File(filename))
        pw.write(memoryCache)
        pw.close()
    }

    // A function to load text from a file, bringing the past to the present
    def loadFromFile(filename: String): Unit = {
        import scala.io.Source
        memoryCache = Source.fromFile(filename).getLines.mkString("\n")
    }

    // Main function, the grand stage where all actors shall perform
    def main(args: Array[String]): Unit = {
        addText("To be, or not to be, that is the question:\n")
        addText("Whether 'tis nobler in the mind to suffer\n")
        addText("The slings and arrows of outrageous fortune,\n")
        addText("Or to take arms against a sea of troubles\n")
        addText("And by opposing end them.\n")
        displayText()
        println(s"Word count: ${wordCount()}")
        println(s"Reversed text: ${reverseText()}")
        replaceWord("sea", "ocean")
        displayText()
        saveToFile("text.txt")
        clearText()
        loadFromFile("text.txt")
        displayText()
    }
}

