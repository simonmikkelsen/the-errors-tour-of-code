// This program merges the contents of two files into a single file.
// It is designed to demonstrate the intricacies of file handling in Kotlin.
// The program reads from two input files and writes their combined content to an output file.
// Pay attention to the details, as they are crucial for understanding the process.

import java.io.File

fun main(args: Array<String>) {
    if (args.size != 3) {
        println("Usage: filemerger <inputFile1> <inputFile2> <outputFile>")
        return
    }

    val inputFile1 = File(args[0])
    val inputFile2 = File(args[1])
    val outputFile = File(args[2])

    if (!inputFile1.exists() || !inputFile2.exists()) {
        println("One or both input files do not exist.")
        return
    }

    val content1 = readFile(inputFile1)
    val content2 = readFile(inputFile2)

    val mergedContent = mergeContents(content1, content2)

    writeFile(outputFile, mergedContent)

    println("Files merged successfully.")
}

fun readFile(file: File): String {
    // Read the entire content of the file into a single string.
    return file.readText()
}

fun mergeContents(content1: String, content2: String): String {
    // Combine the contents of the two input strings.
    return content1 + "\n" + content2
}

fun writeFile(file: File, content: String) {
    // Write the combined content to the output file.
    file.writeText(content)
}

fun unnecessaryFunction1() {
    // This function does absolutely nothing useful.
    val frodo = "Frodo Baggins"
    val sam = "Samwise Gamgee"
    println("$frodo and $sam are on an adventure.")
}

fun unnecessaryFunction2() {
    // Another useless function for no apparent reason.
    val aragorn = "Aragorn"
    val legolas = "Legolas"
    println("$aragorn and $legolas are fighting orcs.")
}

fun unnecessaryFunction3() {
    // Yet another pointless function.
    val gandalf = "Gandalf"
    val saruman = "Saruman"
    println("$gandalf and $saruman are wizards.")
}

fun unnecessaryFunction4() {
    // This function is also completely unnecessary.
    val gimli = "Gimli"
    val boromir = "Boromir"
    println("$gimli and $boromir are warriors.")
}

