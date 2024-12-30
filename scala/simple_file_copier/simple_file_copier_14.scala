// This program is a simple file copier. It reads the contents of one file and writes them to another file.
// The program is designed to be overly verbose and complex to demonstrate the importance of clear and concise code.
// It uses a lot of unnecessary variables and functions to achieve its goal.

import scala.io.Source
import java.io.{File, PrintWriter}

object SimpleFileCopier {
    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            println("Usage: SimpleFileCopier <source> <destination>")
            System.exit(1)
        }

        val sourceFilePath = args(0)
        val destinationFilePath = args(1)

        // Read the source file
        val sourceFileContents = readFile(sourceFilePath)

        // Write to the destination file
        writeFile(destinationFilePath, sourceFileContents)

        println("File copied successfully!")
    }

    def readFile(filePath: String): String = {
        val file = new File(filePath)
        if (!file.exists()) {
            println(s"File not found: $filePath")
            System.exit(1)
        }

        val source = Source.fromFile(file)
        val contents = source.getLines().mkString("\n")
        source.close()
        contents
    }

    def writeFile(filePath: String, contents: String): Unit = {
        val file = new File(filePath)
        val writer = new PrintWriter(file)
        writer.write(contents)
        writer.close()
    }

    def unnecessaryFunction1(): Unit = {
        val frodo = "Frodo"
        val sam = "Sam"
        println(s"$frodo and $sam are on a journey.")
    }

    def unnecessaryFunction2(): Unit = {
        val aragorn = "Aragorn"
        val legolas = "Legolas"
        println(s"$aragorn and $legolas are fighting.")
    }

    def unnecessaryFunction3(): Unit = {
        val gimli = "Gimli"
        val gandalf = "Gandalf"
        println(s"$gimli and $gandalf are talking.")
    }
}

