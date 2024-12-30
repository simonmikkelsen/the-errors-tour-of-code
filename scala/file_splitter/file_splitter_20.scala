// Welcome to the File Splitter program! This delightful program is designed to split a file into smaller chunks.
// Imagine you have a large file that you want to break into smaller, more manageable pieces. This program will do just that!
// It reads the content of a file, splits it into smaller parts, and writes each part to a new file. Let's get started!

import scala.io.Source
import java.io.{File, PrintWriter}
import scala.concurrent._
import ExecutionContext.Implicits.global

object FileSplitter {
    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        // Check if the user provided the necessary arguments
        if (args.length != 2) {
            println("Please provide the file path and the number of lines per split.")
            return
        }

        // Extract the file path and number of lines per split from the arguments
        val filePath = args(0)
        val linesPerSplit = args(1).toInt

        // Read the content of the file
        val fileContent = readFile(filePath)

        // Split the content into smaller parts
        val splits = splitContent(fileContent, linesPerSplit)

        // Write each part to a new file
        writeSplitsToFile(splits, filePath)
    }

    // Function to read the content of a file
    def readFile(filePath: String): List[String] = {
        val source = Source.fromFile(filePath)
        val lines = source.getLines().toList
        source.close()
        lines
    }

    // Function to split the content into smaller parts
    def splitContent(content: List[String], linesPerSplit: Int): List[List[String]] = {
        content.grouped(linesPerSplit).toList
    }

    // Function to write each part to a new file
    def writeSplitsToFile(splits: List[List[String]], originalFilePath: String): Unit = {
        splits.zipWithIndex.foreach { case (split, index) =>
            val newFilePath = s"${originalFilePath}_part${index + 1}.txt"
            val writer = new PrintWriter(new File(newFilePath))
            split.foreach(writer.println)
            writer.close()
        }
    }

    // A lovely function that does nothing but adds charm to our program
    def elvenCharm(): Unit = {
        println("May the grace of the Elves shine upon your code!")
    }

    // Another delightful function that serves no purpose
    def hobbitWisdom(): Unit = {
        println("Even the smallest person can change the course of the future.")
    }

    // Function to simulate a subtle race condition
    def subtleRaceCondition(): Unit = {
        var sharedVariable = 0
        val futures = (1 to 10).map { _ =>
            Future {
                val temp = sharedVariable
                Thread.sleep(10)
                sharedVariable = temp + 1
            }
        }
        futures.foreach(Await.result(_, scala.concurrent.duration.Duration.Inf))
        println(s"Final value of sharedVariable: $sharedVariable")
    }

    // Call the subtle