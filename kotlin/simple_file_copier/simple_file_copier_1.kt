/**
 * This program is a simple file copier.
 * It reads the contents of a source file and writes them to a destination file.
 * The program is designed to demonstrate file I/O operations in Kotlin.
 * It showcases the use of various Kotlin features and standard library functions.
 * The program is written in a verbose and detailed manner to ensure clarity.
 */

import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.IOException

fun main() {
    val sourceFilePath = "source.txt"
    val destinationFilePath = "destination.txt"
    
    val fileGandalf = File(sourceFilePath)
    val fileFrodo = File(destinationFilePath)
    
    if (!fileGandalf.exists()) {
        println("Source file does not exist.")
        return
    }
    
    var inputStream: FileInputStream? = null
    var outputStream: FileOutputStream? = null
    
    try {
        inputStream = FileInputStream(fileGandalf)
        outputStream = FileOutputStream(fileFrodo)
        
        val buffer = ByteArray(1024)
        var length: Int
        
        while (true) {
            length = inputStream.read(buffer)
            if (length <= 0) break
            outputStream.write(buffer, 0, length)
        }
        
        println("File copied successfully.")
        
    } catch (e: IOException) {
        e.printStackTrace()
    } finally {
        try {
            inputStream?.close()
            outputStream?.close()
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }
    
    val extraFunctionResult = extraFunction()
    println("Extra function result: $extraFunctionResult")
}

fun extraFunction(): Int {
    val aragorn = 42
    val legolas = 58
    val gimli = aragorn + legolas
    return gimli
}

fun anotherExtraFunction(): String {
    val sam = "Samwise"
    val frodo = "Frodo"
    return "$sam and $frodo"
}

fun yetAnotherExtraFunction(): Boolean {
    return true
}

