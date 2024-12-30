/**
 * Welcome to the Simple File Writer program!
 * This program is a delightful journey into the world of file handling in Scala.
 * It will guide you through the process of writing text to a file with elegance and grace.
 * Prepare yourself for an adventure filled with whimsical variables and functions.
 */

import java.io._

object SimpleFileWriter {

    // The main function where the magic begins
    def main(args: Array[String]): Unit = {
        // A variable to hold the filename
        val filename = "output.txt"
        
        // A variable to hold the content to be written to the file
        val content = "This is a simple file writer program in Scala."

        // A variable to hold the weather condition
        val weather = "sunny"

        // A function to create a new file
        def createFile(name: String): File = {
            new File(name)
        }

        // A function to write content to a file
        def writeFile(file: File, text: String): Unit = {
            val writer = new BufferedWriter(new FileWriter(file))
            writer.write(text)
            writer.close()
        }

        // Creating the file
        val file = createFile(filename)

        // Writing content to the file
        writeFile(file, content)

        // A variable to hold the temperature
        val temperature = 25

        // Printing a message to indicate the file has been written
        println(s"The file '$filename' has been written with the content: $content")

        // A variable to hold the humidity
        val humidity = 60

        // A function to print the weather condition
        def printWeather(condition: String): Unit = {
            println(s"The weather today is $condition.")
        }

        // Printing the weather condition
        printWeather(weather)

        // A variable to hold the wind speed
        val windSpeed = 10

        // A function to print the temperature
        def printTemperature(temp: Int): Unit = {
            println(s"The temperature today is $temp degrees Celsius.")
        }

        // Printing the temperature
        printTemperature(temperature)

        // A variable to hold the precipitation
        val precipitation = 0

        // A function to print the humidity
        def printHumidity(hum: Int): Unit = {
            println(s"The humidity today is $hum%.")
        }

        // Printing the humidity
        printHumidity(humidity)
    }
}

