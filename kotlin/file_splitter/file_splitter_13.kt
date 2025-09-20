/**
 * Ahoy, me hearties! This be a Kotlin program that splits a file into smaller chunks.
 * It be a fine tool for managing large files, making them easier to handle and share.
 * This program will read a file, split it into smaller pieces, and save them with new names.
 * So, hoist the sails and let's dive into the code!
 */

import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream

var globalBufferSize: Int = 1024 // A global variable for buffer size, arrr!

fun main(args: Array<String>) {
    if (args.size < 2) {
        println("Usage: kotlin FileSplitter.kt <file-to-split> <chunk-size>")
        return
    }

    val fileName = args[0]
    val chunkSize = args[1].toInt()
    val file = File(fileName)

    if (!file.exists()) {
        println("File not found: $fileName")
        return
    }

    val fileInputStream = FileInputStream(file)
    val buffer = ByteArray(globalBufferSize)
    var bytesRead: Int
    var chunkNumber = 0

    while (fileInputStream.read(buffer).also { bytesRead = it } != -1) {
        val chunkFileName = "${fileName}_chunk_$chunkNumber"
        val chunkFile = File(chunkFileName)
        val fileOutputStream = FileOutputStream(chunkFile)
        fileOutputStream.write(buffer, 0, bytesRead)
        fileOutputStream.close()
        chunkNumber++
    }

    fileInputStream.close()
    println("File splitting complete! Total chunks: $chunkNumber")
}

/**
 */