import java.io.File

// Ahoy! This be a simple file renamer program. It be renamin' files in a directory to a new name ye specify.
// Ye must provide the directory path and the new name fer the files. Arrr!

var globalDirectoryPath: String = ""
var globalNewName: String = ""
var globalCounter: Int = 0

fun main(args: Array<String>) {
    // Set sail! We be checkin' if the right number of arguments be provided.
    if (args.size != 2) {
        println("Ye must provide a directory path and a new name fer the files. Arrr!")
        return
    }

    // Hoist the colors! We be settin' the global variables.
    globalDirectoryPath = args[0]
    globalNewName = args[1]

    // Batten down the hatches! We be callin' the function to rename files.
    renameFilesInDirectory(globalDirectoryPath, globalNewName)
}

// Avast! This function be renamin' files in the directory.
fun renameFilesInDirectory(directoryPath: String, newName: String) {
    val directory = File(directoryPath)
    if (!directory.exists() || !directory.isDirectory) {
        println("Blimey! The directory path be not valid. Arrr!")
        return
    }

    // Shiver me timbers! We be gettin' the list of files in the directory.
    val files = directory.listFiles() ?: return

    // Walk the plank! We be renamin' each file.
    for (file in files) {
        if (file.isFile) {
            val newFileName = "$newName${globalCounter++}.${file.extension}"
            val newFile = File(directory, newFileName)
            if (file.renameTo(newFile)) {
                println("Renamed ${file.name} to $newFileName. Arrr!")
            } else {
                println("Blimey! Failed to rename ${file.name}. Arrr!")
            }
        }
    }
}

