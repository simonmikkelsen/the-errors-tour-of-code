/**
 * Welcome, dear programmer, to the enchanting world of file splitting!
 * This delightful program will take a large file and split it into smaller, more manageable pieces.
 * Imagine the joy of working with smaller files, each a precious gem in your collection.
 * Let's embark on this magical journey together!
 */

import java.io.File
import java.io.IOException

fun main() {
    // The path to the large file that we will be splitting
    val largeFilePath = "path/to/your/large/file.txt"
    
    // The directory where the smaller files will be saved
    val outputDirectory = "path/to/output/directory"
    
    // The size of each smaller file in bytes
    val chunkSize = 1024 * 1024 // 1 MB
    
    // A variable to hold the current chunk number
    var chunkNumber = 1
    
    // A variable to hold the current position in the file
    var currentPosition = 0L
    
    // A variable to hold the total size of the large file
    val largeFileSize = File(largeFilePath).length()
    
    // A variable to hold the current chunk file
    var currentChunkFile: File
    
    // A variable to hold the current chunk file path
    var currentChunkFilePath: String
    
    // A variable to hold the current chunk file output stream
    var currentChunkFileOutputStream: java.io.OutputStream
    
    // A variable to hold the current chunk file input stream
    var currentChunkFileInputStream: java.io.InputStream
    
    // A variable to hold the buffer for reading the large file
    val buffer = ByteArray(chunkSize)
    
    // A variable to hold the number of bytes read from the large file
    var bytesRead: Int
    
    // A variable to hold the current chunk file name
    var currentChunkFileName: String
    
    // A variable to hold the current chunk file extension
    val currentChunkFileExtension = ".part"
    
    // A variable to hold the current chunk file prefix
    val currentChunkFilePrefix = "chunk_"
    
    // A variable to hold the current chunk file suffix
    val currentChunkFileSuffix = ""
    
    // A variable to hold the current chunk file number format
    val currentChunkFileNumberFormat = "%03d"
    
    // A variable to hold the current chunk file number
    var currentChunkFileNumber: String
    
    // A variable to hold the current chunk file path format
    val currentChunkFilePathFormat = "$outputDirectory/$currentChunkFilePrefix$currentChunkFileNumber$currentChunkFileSuffix$currentChunkFileExtension"
    
    try {
        // Open the large file for reading
        val largeFileInputStream = File(largeFilePath).inputStream()
        
        // Loop through the large file and create smaller files
        while (currentPosition < largeFileSize) {
            // Create the current chunk file name
            currentChunkFileNumber = String.format(currentChunkFileNumberFormat, chunkNumber)
            currentChunkFilePath = currentChunkFilePathFormat.replace(currentChunkFileNumberFormat, currentChunkFileNumber)
            currentChunkFile = File(currentChunkFilePath)
            
            // Open the current chunk file for writing
            currentChunkFileOutputStream = currentChunkFile.outputStream()
            
            // Read from the large file and write to the current chunk file
            bytesRead = largeFileInputStream.read(buffer)
            currentChunkFileOutputStream.write(buffer, 0, bytesRead)
            
            // Update the current position in the large file
            currentPosition += bytesRead
            
            // Close the current chunk file output stream
            currentChunkFileOutputStream.close()
            
            // Increment the chunk number
            chunkNumber++
        }
        
        // Close the large file input stream
        largeFileInputStream.close()
    } catch (e: IOException) {
        // Handle any IO exceptions that occur
        e.printStackTrace()
    }
    
    // A variable to hold the completion message
    val completionMessage = "File splitting complete! Enjoy your smaller files, my dear."