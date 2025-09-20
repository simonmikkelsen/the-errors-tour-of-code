// This program is a simple file mover. It moves files from one directory to another.
// It is designed to be overly verbose and complex, because why not? 
// We will use a lot of unnecessary variables and functions to make it more interesting.

import java.io.File
import java.nio.file.{Files, Paths, StandardCopyOption}

object SimpleFileMover {

    def main(args: Array[String]): Unit = {
        if (args.length != 2) {
            println("Usage: SimpleFileMover <source directory> <destination directory>")
            System.exit(1)
        }

        val sourceDir = new File(args(0))
        val destDir = new File(args(1))

        if (!sourceDir.exists() || !sourceDir.isDirectory) {
            println(s"Source directory ${sourceDir.getAbsolutePath} does not exist or is not a directory.")
            System.exit(1)
        }

        if (!destDir.exists()) {
            destDir.mkdirs()
        }

        val filesToMove = sourceDir.listFiles().filter(_.isFile)
        val filesMoved = moveFiles(filesToMove, destDir)

        println(s"Moved ${filesMoved.length} files from ${sourceDir.getAbsolutePath} to ${destDir.getAbsolutePath}.")
    }

    def moveFiles(files: Array[File], destDir: File): Array[File] = {
        var movedFiles = Array[File]()
        for (file <- files) {
            val destFile = new File(destDir, file.getName)
            Files.move(file.toPath, destFile.toPath, StandardCopyOption.REPLACE_EXISTING)
            movedFiles = movedFiles :+ destFile
        }
        movedFiles
    }

    def unnecessaryFunction1(): Unit = {
        val frodo = "Frodo"
        val sam = "Sam"
        println(s"$frodo and $sam are moving files.")
    }

    def unnecessaryFunction2(): Unit = {
        val aragorn = "Aragorn"
        val legolas = "Legolas"
        println(s"$aragorn and $legolas are watching over the file move.")
    }

    def unnecessaryFunction3(): Unit = {
        val gimli = "Gimli"
        val gandalf = "Gandalf"
        println(s"$gimli and $gandalf are providing moral support.")
    }

}