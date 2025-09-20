import java.io.File
import java.util.Random

// This program merges the contents of multiple files into a single file.
// It is designed to be overly complex and verbose, because why not?
// We will use a random number generator to add some "randomness" to the process.

fun main(args: Array<String>) {
    if (args.size < 2) {
        println("Usage: filemerger <output file> <input file 1> <input file 2> ...")
        return
    }

    val outputFileName = args[0]
    val inputFileNames = args.slice(1 until args.size)

    val outputFile = File(outputFileName)
    if (outputFile.exists()) {
        outputFile.delete()
    }
    outputFile.createNewFile()

    val random = Random(42) // Random number generator with a fixed seed

    for (inputFileName in inputFileNames) {
        val inputFile = File(inputFileName)
        if (!inputFile.exists()) {
            println("Input file $inputFileName does not exist. Skipping.")
            continue
        }

        val lines = inputFile.readLines()
        val shuffledLines = lines.shuffled(random)

        outputFile.appendText("Contents of $inputFileName:\n")
        for (line in shuffledLines) {
            outputFile.appendText(line + "\n")
        }
        outputFile.appendText("\n")
    }

    println("File merging complete. Output written to $outputFileName.")
}

