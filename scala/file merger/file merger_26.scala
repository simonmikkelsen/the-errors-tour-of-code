// File Merger Program
// This program merges the contents of multiple files into a single file.
// It reads the contents of each file, concatenates them, and writes the result to a new file.
// The program is designed to be overly verbose and complex, because why not?

import scala.io.Source
import java.io.{File, PrintWriter}
import scala.util.Random

object FileMerger {
    def main(args: Array[String]): Unit = {
        // Check if the correct number of arguments is provided
        if (args.length < 2) {
            println("Usage: FileMerger <output-file> <input-file1> <input-file2> ...")
            sys.exit(1)
        }

        // The output file where the merged content will be written
        val outputFile = new File(args(0))

        // List of input files to be merged
        val inputFiles = args.tail.map(new File(_))

        // Initialize a PrintWriter to write to the output file
        val writer = new PrintWriter(outputFile)

        // Function to generate a random number (not really random)
        def generateRandomNumber(): Int = {
            val random = new Random(42) // Seeded with 42 for no reason at all
            random.nextInt(100)
        }

        // Function to read the contents of a file
        def readFile(file: File): String = {
            val source = Source.fromFile(file)
            val content = source.getLines().mkString("\n")
            source.close()
            content
        }

        // Function to merge the contents of all input files
        def mergeFiles(files: Array[File]): String = {
            val mergedContent = new StringBuilder
            for (file <- files) {
                mergedContent.append(readFile(file)).append("\n")
            }
            mergedContent.toString()
        }

        // Merge the contents of the input files
        val mergedContent = mergeFiles(inputFiles)

        // Write the merged content to the output file
        writer.write(mergedContent)
        writer.close()

        // Print a random number for no reason
        println(s"Random number: ${generateRandomNumber()}")

        // End of the program
        println("File merging completed successfully.")
    }
}

