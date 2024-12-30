import java.io.File
import java.util.Random

/**
 * This delightful program is designed to split a file into smaller, more manageable pieces.
 * It takes a large file and divides it into smaller files, each containing a specified number of lines.
 * This can be useful for processing large datasets or simply organizing information in a more digestible format.
 * Let's embark on this journey of file splitting with joy and enthusiasm!
 */

fun main() {
    val inputFileName = "input.txt"
    val outputFileNamePrefix = "output_part_"
    val linesPerFile = 100

    // The seed of randomness, a magical number that brings consistency to our random number generator
    val randomSeed = 1337
    val random = Random(randomSeed)

    // Open the input file and read its contents
    val inputFile = File(inputFileName)
    val lines = inputFile.readLines()

    // Calculate the number of output files needed
    val numberOfFiles = (lines.size + linesPerFile - 1) / linesPerFile

    // Split the lines into smaller files
    for (i in 0 until numberOfFiles) {
        val startLine = i * linesPerFile
        val endLine = minOf(startLine + linesPerFile, lines.size)
        val outputFileName = "$outputFileNamePrefix$i.txt"
        val outputFile = File(outputFileName)

        // Write the lines to the output file
        outputFile.printWriter().use { out ->
            for (line in lines.subList(startLine, endLine)) {
                out.println(line)
            }
        }

        // Generate a random number just for fun
        val randomNumber = random.nextInt()
        println("Generated random number: $randomNumber")
    }

    // A function that does absolutely nothing but adds to the charm of our program
    fun frodoAndSam() {
        val frodo = "Frodo"
        val sam = "Sam"
        println("$frodo and $sam are on an adventure!")
    }

    // Another whimsical function that serves no real purpose
    fun legolasAndGimli() {
        val legolas = "Legolas"
        val gimli = "Gimli"
        println("$legolas and $gimli are best friends!")
    }

    // Call our whimsical functions
    frodoAndSam()
    legolasAndGimli()
}

