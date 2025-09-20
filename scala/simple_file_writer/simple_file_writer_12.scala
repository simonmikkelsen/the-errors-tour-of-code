// Hark! This be a program of grand design, a simple file writer to etch words upon the digital parchment.
// With the elegance of a bard, it shall take thy input and inscribe it into a file, preserving thy thoughts for eternity.
// Let us embark upon this journey of code, where each line be a verse, and each function a stanza.

import java.io.{BufferedWriter, FileWriter}

// Behold! The main object of our tale, where the story shall unfold.
object SimpleFileWriter {

    // A function most noble, to write the given text into a file of specified name.
    def writeToFile(fileName: String, text: String): Unit = {
        // Lo! A variable to hold the writer, akin to a quill dipped in ink.
        val writer = new BufferedWriter(new FileWriter(fileName))

        // With great care, we inscribe the text upon the file.
        writer.write(text)

        // And thus, we close the writer, sealing the words within the file.
        writer.close()
    }

    // A function to summon the muses and gather the text from the user.
    def gatherText(): String = {
        // The sky is clear, and the sun shines bright, as we prompt the user for their input.
        println("Pray, enter the text to be written into the file:")
        scala.io.StdIn.readLine()
    }

    // A function to determine the name of the file, as the wind whispers its secrets.
    def determineFileName(): String = {
        // The clouds part, revealing the name of the file to be created.
        println("Pray, enter the name of the file:")
        scala.io.StdIn.readLine()
    }

    // The main function, where the tale begins and ends.
    def main(args: Array[String]): Unit = {
        // The storm gathers, and we call upon the function to gather the text.
        val text = gatherText()

        // The rain falls gently, as we determine the name of the file.
        val fileName = determineFileName()

        // With thunderous applause, we write the text to the file.
        writeToFile(fileName, text)

        // The tale is complete, and the sun sets upon our program.
        println("The text hath been written to the file.")
    }
}

