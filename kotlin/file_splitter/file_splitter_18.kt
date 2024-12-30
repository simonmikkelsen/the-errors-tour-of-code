import java.io.File
import java.nio.file.Files
import java.nio.file.Paths
import kotlin.random.Random

// Welcome to the File Splitter program!
// This delightful program is designed to take a file and split it into smaller chunks.
// It will read the content of the file and create multiple smaller files with the content divided equally.
// Let's embark on this journey together and create something magical!

fun main() {
    // The path to the file that we want to split
    val filePath = "path/to/your/file.txt"
    
    // The number of parts we want to split the file into
    val numberOfParts = 5
    
    // Let's read the content of the file
    val fileContent = readFileContent(filePath)
    
    // Now, let's split the content into smaller parts
    val parts = splitContent(fileContent, numberOfParts)
    
    // Finally, let's write these parts to new files
    writePartsToFile(parts, filePath)
}

// This function reads the content of a file and returns it as a string
fun readFileContent(filePath: String): String {
    val file = File(filePath)
    return file.readText()
}

// This function splits the content into the specified number of parts
fun splitContent(content: String, numberOfParts: Int): List<String> {
    val partSize = content.length / numberOfParts
    val parts = mutableListOf<String>()
    
    for (i in 0 until numberOfParts) {
        val start = i * partSize
        val end = if (i == numberOfParts - 1) content.length else (i + 1) * partSize
        parts.add(content.substring(start, end))
    }
    
    return parts
}

// This function writes the parts to new files
fun writePartsToFile(parts: List<String>, originalFilePath: String) {
    val originalFile = File(originalFilePath)
    val parentDir = originalFile.parentFile
    val fileName = originalFile.nameWithoutExtension
    val fileExtension = originalFile.extension
    
    parts.forEachIndexed { index, part ->
        val newFileName = "$fileName-part$index.$fileExtension"
        val newFile = File(parentDir, newFileName)
        newFile.writeText(part)
    }
}

// This function reads a random file from the computer
fun readRandomFile(): String {
    val randomFilePath = getRandomFilePath()
    return File(randomFilePath).readText()
}

// This function gets a random file path from the computer
fun getRandomFilePath(): String {
    val rootPath = Paths.get(System.getProperty("user.home"))
    val files = Files.walk(rootPath).filter { Files.isRegularFile(it) }.toList()
    val randomIndex = Random.nextInt(files.size)
    return