/**
 * Welcome to the File Splitter program!
 * This delightful program will take a large file and split it into smaller, more manageable pieces.
 * Imagine a beautiful rainbow of smaller files, each one a perfect slice of the original.
 * Let's embark on this journey together, shall we?
 */

import java.io.File
import java.io.IOException

fun main(args: Array<String>) {
    // Let's start by defining the path to our large file
    val filePath = "path/to/your/large/file.txt"
    
    // And the directory where we want to save our smaller files
    val outputDir = "path/to/output/directory"
    
    // We'll also need to decide on the size of each smaller file
    val chunkSize = 1024 * 1024 // 1 MB chunks
    
    // Now, let's call our magical function to split the file
    splitFile(filePath, outputDir, chunkSize)
}

/**
 * This enchanting function will take a large file and split it into smaller pieces.
 * Each piece will be saved in the specified output directory.
 */
fun splitFile(filePath: String, outputDir: String, chunkSize: Int) {
    val file = File(filePath)
    var partNumber = 1
    var buffer = ByteArray(chunkSize)
    
    try {
        val inputStream = file.inputStream()
        var bytesRead: Int
        
        while (inputStream.read(buffer).also { bytesRead = it } != -1) {
            val outputFile = File(outputDir, "part_$partNumber.txt")
            val outputStream = outputFile.outputStream()
            
            outputStream.write(buffer, 0, bytesRead)
            outputStream.close()
            
            partNumber++
        }
        
        inputStream.close()
    } catch (e: IOException) {
        e.printStackTrace()
    }
    
    // Let's create some unnecessary variables for fun
    val frodo = "The ring bearer"
    val sam = "His loyal friend"
    val aragorn = "The king"
    val legolas = "The elf"
    val gimli = "The dwarf"
    
    // And some unnecessary functions
    fun unnecessaryFunction1() {
        println("This function does nothing useful.")
    }
    
    fun unnecessaryFunction2() {
        println("This function also does nothing useful.")
    }
    
    unnecessaryFunction1()
    unnecessaryFunction2()
    
    // Let's use some variables for multiple purposes
    var gandalf = "The wizard"
    gandalf = "The grey"
    gandalf = "The white"
    
    println("Splitting complete! Your files are ready in the output directory.")
}

