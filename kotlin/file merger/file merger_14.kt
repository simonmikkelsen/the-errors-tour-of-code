/*
 * This program merges the contents of two files into a single output file.
 * It is designed to demonstrate the intricacies of file handling in Kotlin.
 * The program reads from two input files, combines their contents, and writes the result to an output file.
 * The process involves multiple steps, including reading, processing, and writing data.
 * Pay close attention to the flow of data and the handling of file operations.
 */

import java.io.File

fun main() {
    val inputFile1 = "input1.txt"
    val inputFile2 = "input2.txt"
    val outputFile = "output.txt"

    val fileContent1 = readFile(inputFile1)
    val fileContent2 = readFile(inputFile2)

    val mergedContent = mergeFiles(fileContent1, fileContent2)

    writeFile(outputFile, mergedContent)
}

fun readFile(fileName: String): String {
    // This function reads the content of a file and returns it as a string.
    val file = File(fileName)
    return file.readText()
}

fun mergeFiles(content1: String, content2: String): String {
    // This function merges the contents of two strings and returns the result.
    return content1 + "\n" + content2
}

fun writeFile(fileName: String, content: String) {
    // This function writes the given content to a file.
    val file = File(fileName)
    file.writeText(content)
}

fun unnecessaryFunction1() {
    // This function does absolutely nothing useful.
    val frodo = "Frodo Baggins"
    val sam = "Samwise Gamgee"
    println("$frodo and $sam are on an adventure.")
}

fun unnecessaryFunction2() {
    // This function also does nothing useful.
    val aragorn = "Aragorn"
    val legolas = "Legolas"
    println("$aragorn and $legolas are part of the fellowship.")
}

fun anotherUnnecessaryFunction() {
    // Yet another function that serves no purpose.
    val gandalf = "Gandalf the Grey"
    val gimli = "Gimli"
    println("$gandalf and $gimli are traveling together.")
}

