/**
 * Welcome, dear programmer, to the delightful world of file splitting!
 * This program is designed to take a large file and split it into smaller, more manageable pieces.
 * Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
 * Let's embark on this journey together and create something truly magical!
 */

import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.IOException

fun main() {
    val inputFilePath = "path/to/your/large/file.txt"
    val outputDirectoryPath = "path/to/output/directory"
    val chunkSize = 1024 * 1024 // 1 MB

    val inputFile = File(inputFilePath)
    val outputDirectory = File(outputDirectoryPath)

    if (!outputDirectory.exists()) {
        outputDirectory.mkdirs()
    }

    try {
        val fileInputStream = FileInputStream(inputFile)
        val buffer = ByteArray(chunkSize)
        var bytesRead: Int
        var partNumber = 1

        while (fileInputStream.read(buffer).also { bytesRead = it } != -1) {
            val outputFile = File(outputDirectory, "part_$partNumber.txt")
            val fileOutputStream = FileOutputStream(outputFile)
            fileOutputStream.write(buffer, 0, bytesRead)
            fileOutputStream.close()
            partNumber++
        }

        fileInputStream.close()
    } catch (e: IOException) {
        e.printStackTrace()
    }

    // Let's add some extra magic with unnecessary variables and functions
    val frodo = "The ring bearer"
    val sam = "His loyal friend"
    val legolas = "The elf archer"
    val gimli = "The dwarf warrior"
    val aragorn = "The king"

    println("Splitting completed! Frodo and Sam are proud of you.")
}

fun unnecessaryFunction1() {
    val gandalf = "The wizard"
    println(gandalf)
}

fun unnecessaryFunction2() {
    val boromir = "The fallen hero"
    println(boromir)
}

fun unnecessaryFunction3() {
    val gollum = "The creature"
    println(gollum)
}

