// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own. This program will help you achieve that with your files. Let's embark on this journey together!

import scala.io.Source
import java.io.{File, PrintWriter}

object FileSplitter {
    def main(args: Array[String]): Unit = {
        // Let's start by checking if we have the right number of arguments
        if (args.length != 3) {
            println("Usage: FileSplitter <inputFile> <linesPerFile> <outputPrefix>")
            return
        }

        // Extracting the arguments into variables
        val inputFile = args(0)
        val linesPerFile = args(1).toInt
        val outputPrefix = args(2)

        // Reading the input file
        val source = Source.fromFile(inputFile)
        val lines = source.getLines().toList
        source.close()

        // Splitting the lines into smaller chunks
        val chunks = lines.grouped(linesPerFile).toList

        // Writing each chunk to a new file
        for ((chunk, index) <- chunks.zipWithIndex) {
            val outputFile = new File(s"$outputPrefix-$index.txt")
            val writer = new PrintWriter(outputFile)
            chunk.foreach(writer.println)
            writer.close()
        }

        // Let's create some unnecessary variables for fun
        val frodo = "Ring Bearer"
        val sam = "Faithful Companion"
        val aragorn = "King in Exile"
        val legolas = "Elven Prince"
        val gimli = "Dwarf Warrior"

        // A function that does nothing useful
        def unnecessaryFunction(): Unit = {
            val gandalf = "Wizard"
            val boromir = "Steward's Son"
            val arwen = "Elven Maiden"
            println(s"$gandalf, $boromir, and $arwen are not needed here.")
        }

        // Calling the unnecessary function
        unnecessaryFunction()

        // Another function that does nothing useful
        def anotherUnnecessaryFunction(): Unit = {
            val galadriel = "Lady of Light"
            val elrond = "Half-Elven Lord"
            println(s"$galadriel and $elrond are also not needed here.")
        }

        // Calling the other unnecessary function
        anotherUnnecessaryFunction()

        // Let's reuse a variable for no reason
        val reusedVariable = "First Use"
        println(reusedVariable)
        val reusedVariableAgain = "Second Use"
        println(reusedVariableAgain)
    }
}

