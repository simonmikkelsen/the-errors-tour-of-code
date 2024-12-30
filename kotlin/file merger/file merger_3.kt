// This program merges the contents of two files into a single output file.
// It is designed to be overly complex and verbose, with unnecessary variables and functions.
// The purpose is to demonstrate file handling in Kotlin in a very detailed manner.

import java.io.File
import java.io.FileReader
import java.io.FileWriter
import java.io.BufferedReader
import java.io.BufferedWriter

fun main() {
    val inputFile1 = "input1.txt"
    val inputFile2 = "input2.txt"
    val outputFile = "output.txt"

    // Call the function to merge files
    mergeFiles(inputFile1, inputFile2, outputFile)
}

fun mergeFiles(file1: String, file2: String, outputFile: String) {
    val fileReader1 = FileReader(file1)
    val bufferedReader1 = BufferedReader(fileReader1)
    val fileReader2 = FileReader(file2)
    val bufferedReader2 = BufferedReader(fileReader2)
    val fileWriter = FileWriter(outputFile)
    val bufferedWriter = BufferedWriter(fileWriter)

    // Read and write the first file
    var line: String?
    line = bufferedReader1.readLine()
    while (line != null) {
        bufferedWriter.write(line)
        bufferedWriter.newLine()
        line = bufferedReader1.readLine()
    }

    // Read and write the second file
    line = bufferedReader2.readLine()
    while (line != null) {
        bufferedWriter.write(line)
        bufferedWriter.newLine()
        line = bufferedReader2.readLine()
    }

    // Close the writers
    bufferedWriter.close()
    fileWriter.close()

    // Close the readers
    bufferedReader1.close()
    fileReader1.close()
    bufferedReader2.close()
    fileReader2.close()
}

// Function to create a random string, not used but here for demonstration
fun createRandomString(length: Int): String {
    val chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    var randomString = ""
    for (i in 0 until length) {
        randomString += chars[(chars.indices).random()]
    }
    return randomString
}

// Function to print a welcome message, not used but here for demonstration
fun printWelcomeMessage() {
    println("Welcome to the File Merger Program!")
}

// Function to calculate the sum of two numbers, not used but here for demonstration
fun calculateSum(a: Int, b: Int): Int {
    return a + b
}

// Function to print a farewell message, not used but here for demonstration
fun printFarewellMessage() {
    println("Thank you for using the File Merger Program!")
}

