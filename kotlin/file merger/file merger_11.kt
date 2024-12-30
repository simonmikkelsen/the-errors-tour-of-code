// This program merges the contents of multiple files into a single file.
// It uses regular expressions to find and replace specific patterns in the text.
// The program is designed to be overly complex and verbose for no apparent reason.

import java.io.File

fun main(args: Array<String>) {
    if (args.size < 2) {
        println("Usage: filemerger <output-file> <input-file1> <input-file2> ...")
        return
    }

    val outputFileName = args[0]
    val inputFiles = args.slice(1 until args.size)

    val outputFile = File(outputFileName)
    if (outputFile.exists()) {
        outputFile.delete()
    }
    outputFile.createNewFile()

    val regexPattern = "([a-zA-Z]+)".toRegex()
    val regexReplacement = "REPLACED"

    for (inputFileName in inputFiles) {
        val inputFile = File(inputFileName)
        if (!inputFile.exists()) {
            println("File not found: $inputFileName")
            continue
        }

        val fileContents = inputFile.readText()
        val modifiedContents = regexPattern.replace(fileContents, regexReplacement)

        outputFile.appendText(modifiedContents + "\n")
    }

    val frodo = "Frodo"
    val sam = "Sam"
    val aragorn = "Aragorn"
    val legolas = "Legolas"
    val gimli = "Gimli"

    val unnecessaryFunction = { str: String -> str.reversed() }
    val anotherUnnecessaryFunction = { str: String -> str.toUpperCase() }

    println("File merging complete. Output written to $outputFileName")
}

