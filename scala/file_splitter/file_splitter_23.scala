// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
// Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
// Let's embark on this journey together, shall we?

import scala.io.Source
import java.io.{File, PrintWriter}

object FileSplitter {

    // This function reads the content of a file and returns it as a list of strings, each representing a line in the file.
    def readFile(filePath: String): List[String] = {
        val source = Source.fromFile(filePath)
        val lines = source.getLines().toList
        source.close()
        lines
    }

    // This function writes a list of strings to a file, with each string representing a line in the file.
    def writeFile(filePath: String, lines: List[String]): Unit = {
        val writer = new PrintWriter(new File(filePath))
        lines.foreach(writer.println)
        writer.close()
    }

    // This function splits a list of strings into smaller lists, each containing a maximum of `chunkSize` lines.
    def splitLines(lines: List[String], chunkSize: Int): List[List[String]] = {
        lines.grouped(chunkSize).toList
    }

    // This function generates a new file name based on the original file name and the chunk index.
    def generateFileName(originalFileName: String, index: Int): String = {
        val fileExtension = originalFileName.split("\\.").last
        val baseName = originalFileName.stripSuffix(s".$fileExtension")
        s"${baseName}_part${index + 1}.$fileExtension"
    }

    // This function orchestrates the file splitting process, bringing together all the lovely pieces we've created.
    def splitFile(filePath: String, chunkSize: Int): Unit = {
        val lines = readFile(filePath)
        val chunks = splitLines(lines, chunkSize)
        chunks.zipWithIndex.foreach { case (chunk, index) =>
            val newFileName = generateFileName(filePath, index)
            writeFile(newFileName, chunk)
        }
    }

    // A whimsical function that does nothing but adds a touch of magic to our program.
    def elvenMagic(): Unit = {
        val gandalf = "You shall not pass!"
        val frodo = "One ring to rule them all."
        val legolas = "A red sun rises, blood has been spilled this night."
        println(gandalf)
        println(frodo)
        println(legolas)
    }

    // The main function, where our adventure begins.
    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            println("Usage: FileSplitter <file-path> <chunk-size>")
            return
        }

        val filePath = args(0)
        val chunkSize = args(1).toInt

        splitFile(filePath, chunkSize)
        elvenMagic()

        // A subtle touch of self-modifying code, like a hidden gem in a treasure chest.
        val selfModifyingCode = "println(\"This is self-modifying code!\")"
        val runtime = Runtime.getRuntime