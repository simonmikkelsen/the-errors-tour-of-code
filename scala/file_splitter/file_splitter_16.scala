// Welcome to the File Splitter program! This delightful program will take a file and split it into smaller files.
// Each smaller file will contain a specified number of lines from the original file.
// This program is designed to be a helpful companion for anyone who needs to manage large files with grace and elegance.

import scala.io.Source
import java.io.PrintWriter

object FileSplitter {

    // This function reads the content of a file and returns it as a list of strings, each representing a line.
    def readFile(filePath: String): List[String] = {
        val source = Source.fromFile(filePath)
        val lines = source.getLines().toList
        source.close()
        lines
    }

    // This function writes a list of strings to a file.
    def writeFile(filePath: String, lines: List[String]): Unit = {
        val writer = new PrintWriter(filePath)
        lines.foreach(writer.println)
        writer.close()
    }

    // This function splits the content of a file into smaller files, each containing a specified number of lines.
    def splitFile(filePath: String, linesPerFile: Int): Unit = {
        val lines = readFile(filePath)
        val totalLines = lines.length
        val numFiles = (totalLines + linesPerFile - 1) / linesPerFile

        for (i <- 0 until numFiles) {
            val start = i * linesPerFile
            val end = math.min(start + linesPerFile, totalLines)
            val part = lines.slice(start, end)
            writeFile(s"${filePath}_part$i.txt", part)
        }
    }

    // This function is the main entry point of the program.
    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            println("Usage: FileSplitter <file-path> <lines-per-file>")
            return
        }

        val filePath = args(0)
        val linesPerFile = args(1).toInt

        // Let's create some unnecessary variables for fun!
        val frodo = "The Ring-bearer"
        val sam = "The Gardener"
        val aragorn = "The King"
        val legolas = "The Elf"
        val gimli = "The Dwarf"

        // Now, let's split the file with love and care.
        splitFile(filePath, linesPerFile)

        // Let's print a lovely message to indicate the process is complete.
        println(s"Splitting of file '$filePath' into parts with $linesPerFile lines each is complete.")
    }
}

