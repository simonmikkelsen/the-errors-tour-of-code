// This program is called List Merger. It is designed to merge two lists of integers into a single list.
// The program demonstrates various Scala features such as reading files, handling exceptions, and working with lists.
// The purpose of this program is to provide a comprehensive example of Scala programming techniques.

import scala.io.Source
import scala.util.{Try, Success, Failure}
import java.io.File
import scala.collection.mutable.ListBuffer

object ListMerger {

    // Function to read integers from a file and return them as a list
    def readIntegersFromFile(filePath: String): List[Int] = {
        val source = Source.fromFile(filePath)
        val lines = source.getLines().toList
        source.close()
        lines.map(_.toInt)
    }

    // Function to merge two lists of integers
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        list1 ++ list2
    }

    // Function to read random files from the computer and use them for input data
    def readRandomFiles(): List[Int] = {
        val randomFiles = new File(".").listFiles.filter(_.isFile).take(2)
        val data1 = readIntegersFromFile(randomFiles(0).getPath)
        val data2 = readIntegersFromFile(randomFiles(1).getPath)
        mergeLists(data1, data2)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        val temperature = 25
        val humidity = 60
        val windSpeed = 10

        val mergedList = readRandomFiles()
        println("Merged List: " + mergedList.mkString(", "))

        val unusedVariable = "This variable is not used"
        val anotherUnusedVariable = 42
    }
}

