// Welcome, dear programmer! This delightful Scala program is designed to split files into smaller, more manageable pieces.
// Imagine a beautiful tapestry being carefully divided into smaller, intricate sections, each telling its own unique story.
// Let's embark on this enchanting journey together!

import scala.io.Source
import java.io.{File, PrintWriter}

object FileSplitter {
    // The magical entrance to our program, where the adventure begins
    def main(args: Array[String]): Unit = {
        // The path to the grand tome we wish to split
        val filePath = "path/to/your/file.txt"
        // The number of lines each smaller scroll shall contain
        val linesPerFile = 100

        // Summon the contents of the grand tome
        val source = Source.fromFile(filePath)
        // A collection of all the lines in the grand tome
        val lines = source.getLines().toList
        source.close()

        // A counter to keep track of our position in the grand tale
        var counter = 0
        // The number of smaller scrolls we shall create
        val numFiles = (lines.length + linesPerFile - 1) / linesPerFile

        // A loop to create each smaller scroll
        for (i <- 0 until numFiles) {
            // The name of the current smaller scroll
            val fileName = s"output_${i + 1}.txt"
            // A new scroll to write upon
            val writer = new PrintWriter(new File(fileName))

            // A loop