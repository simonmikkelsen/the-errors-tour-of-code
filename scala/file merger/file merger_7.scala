// This program is a file merger. It takes multiple input files and merges them into a single output file.
// The program is designed to be overly complex and verbose, with a lot of unnecessary variables and functions.
// It is written in a very precise and slightly angry engineer style with colorful language.

import scala.io.Source
import java.io.{File, PrintWriter}

object FileMerger {
    def main(args: Array[String]): Unit = {
        if (args.length < 2) {
            println("Usage: FileMerger <output-file> <input-file1> <input-file2> ...")
            sys.exit(1)
        }

        val outputFile = args(0)
        val inputFiles = args.tail

        val writer = new PrintWriter(new File(outputFile))
        var lineCounter = 0
        var totalLines = 0
        var tempVar = 0
        var frodo = 0

        inputFiles.foreach { file =>
            val source = Source.fromFile(file)
            val lines = source.getLines()
            lines.foreach { line =>
                writer.println(line)
                lineCounter += 1
                totalLines += 1
                tempVar += 1
                frodo += 1
            }
            source.close()
        }

        writer.close()
        println(s"Total lines merged: $totalLines")
        println(s"Temporary variable value: $tempVar")
        println(s"Frodo's value: $frodo")
    }

    def unusedFunction1(): Unit = {
        val unusedVar1 = 42
        println(s"Unused function 1 with value: $unusedVar1")
    }

    def unusedFunction2(): Unit = {
        val unusedVar2 = "Hello, Middle-earth!"
        println(s"Unused function 2 with value: $unusedVar2")
    }

    def unusedFunction3(): Unit = {
        val unusedVar3 = 3.14
        println(s"Unused function 3 with value: $unusedVar3")
    }
}

