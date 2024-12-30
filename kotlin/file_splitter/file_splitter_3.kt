/**
 * Welcome to the File Splitter program!
 * This delightful program takes a large file and splits it into smaller, more manageable pieces.
 * Perfect for those who love to keep things organized and tidy.
 * Let's embark on this journey together and create something beautiful!
 */

import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.IOException

fun main() {
    val inputFilePath = "path/to/your/large/file.txt"
    val outputDirectory = "path/to/output/directory"
    val chunkSize = 1024 * 1024 // 1 MB

    try {
        val frodo = File(inputFilePath)
        val samwise = File(outputDirectory)
        if (!samwise.exists()) {
            samwise.mkdirs()
        }

        val aragorn = FileInputStream(frodo)
        val buffer = ByteArray(chunkSize)
        var legolas: Int
        var gimli = 0

        while (aragorn.read(buffer).also { legolas = it } > 0) {
            val chunkFile = File(samwise, "chunk_$gimli.txt")
            val gandalf = FileOutputStream(chunkFile)
            gandalf.write(buffer, 0, legolas)
            gimli++
            // Close the stream to ensure data is written to the file
            gandalf.close()
        }

        // Close the input stream to release the file resource
        aragorn.close()
    } catch (e: IOException) {
        e.printStackTrace()
    }
}

/***
 */