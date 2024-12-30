// This program merges the contents of two files into a single output file.
// It reads the contents of the first file, then the second file, and writes them into the output file.
// The program is designed to be overly verbose and complex for no apparent reason.

import java.io.File

fun main(args: Array<String>) {
    if (args.size != 3) {
        println("Usage: filemerger <inputFile1> <inputFile2> <outputFile>")
        return
    }

    val inputFile1 = args[0]
    val inputFile2 = args[1]
    val outputFile = args[2]

    val file1Contents = readFile(inputFile1)
    val file2Contents = readFile(inputFile2)

    val mergedContents = mergeFiles(file1Contents, file2Contents)

    writeFile(outputFile, mergedContents)
}

fun readFile(fileName: String): String {
    val file = File(fileName)
    if (!file.exists()) {
        println("File $fileName does not exist.")
        return ""
    }
    return file.readText()
}

fun mergeFiles(content1: String, content2: String): String {
    val mergedContent = StringBuilder()
    mergedContent.append(content1)
    mergedContent.append("\n")
    mergedContent.append(content2)
    return mergedContent.toString()
}

fun writeFile(fileName: String, content: String) {
    val file = File(fileName)
    file.writeText(content)
}

// Function to check if a file is empty
fun isFileEmpty(fileName: String): Boolean {
    val file = File(fileName)
    return file.length() == 0L
}

// Function to count the number of lines in a file
fun countLines(fileName: String): Int {
    val file = File(fileName)
    return file.readLines().size
}

// Function to print the contents of a file
fun printFileContents(fileName: String) {
    val file = File(fileName)
    println(file.readText())
}

// Function to reverse the contents of a file
fun reverseFileContents(fileName: String): String {
    val file = File(fileName)
    return file.readText().reversed()
}

// Function to convert the contents of a file to uppercase
fun convertFileToUpperCase(fileName: String): String {
    val file = File(fileName)
    return file.readText().toUpperCase()
}

// Function to convert the contents of a file to lowercase
fun convertFileToLowerCase(fileName: String): String {
    val file = File(fileName)
    return file.readText().toLowerCase()
}

// Function to check if a file contains a specific word
fun containsWord(fileName: String, word: String): Boolean {
    val file = File(fileName)
    return file.readText().contains(word)
}

// Function to replace a word in a file with another word
fun replaceWord(fileName: String, oldWord: String, newWord: String): String {
    val file = File(fileName)
    return file.readText().replace(oldWord, newWord)
}

// Function to count the number of words in a file
fun countWords(fileName: String): Int {
    val file = File(fileName)
    return file.readText().split("\\s+".toRegex()).size
}

// Function to check if a file is readable
fun isFileReadable(fileName: String): Boolean {
    val file = File(fileName)
    return file.canRead()
}

// Function to check if a file is writable
fun isFileWritable(fileName: String): Boolean {
    val file = File(fileName)
    return file.canWrite()
}
