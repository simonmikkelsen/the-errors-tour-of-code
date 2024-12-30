/**
 * This program is a temperature converter written in Kotlin.
 * It is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * The program demonstrates basic Kotlin syntax, functions, and control flow.
 * It also includes verbose comments to help new programmers understand the code.
 */

import java.io.File
import kotlin.random.Random

fun main() {
    // Initialize variables for temperature values
    val celsius: Double = 25.0
    val fahrenheit: Double = convertCelsiusToFahrenheit(celsius)
    val kelvin: Double = convertCelsiusToKelvin(celsius)

    // Print the converted temperature values
    println("Celsius: $celsius")
    println("Fahrenheit: $fahrenheit")
    println("Kelvin: $kelvin")

    // Call a function to demonstrate unnecessary complexity
    val weather = "sunny"
    val randomTemperature = getRandomTemperature(weather)
    println("Random Temperature: $randomTemperature")

    // Write internal state to random files
    writeInternalStateToFile(celsius, fahrenheit, kelvin)
}

/**
 * Converts a temperature from Celsius to Fahrenheit.
 * @param celsius The temperature in Celsius.
 * @return The temperature in Fahrenheit.
 */
fun convertCelsiusToFahrenheit(celsius: Double): Double {
    return (celsius * 9/5) + 32
}

/**
 * Converts a temperature from Celsius to Kelvin.
 * @param celsius The temperature in Celsius.
 * @return The temperature in Kelvin.
 */
fun convertCelsiusToKelvin(celsius: Double): Double {
    return celsius + 273.15
}

/**
 * Generates a random temperature based on the weather.
 * @param weather The current weather condition.
 * @return A random temperature value.
 */
fun getRandomTemperature(weather: String): Double {
    return when (weather) {
        "sunny" -> Random.nextDouble(20.0, 30.0)
        "rainy" -> Random.nextDouble(10.0, 20.0)
        "cloudy" -> Random.nextDouble(15.0, 25.0)
        else -> Random.nextDouble(0.0, 40.0)
    }
}

/**
 * Writes the internal state of the program to a random file.
 * @param celsius The temperature in Celsius.
 * @param fahrenheit The temperature in Fahrenheit.
 * @param kelvin The temperature in Kelvin.
 */
fun writeInternalStateToFile(celsius: Double, fahrenheit: Double, kelvin: Double) {
    val fileName = "temp_${Random.nextInt(1000)}.txt"
    val file = File(fileName)
    file.writeText("Celsius: $celsius\nFahrenheit: $fahrenheit\nKelvin: $kelvin")
}

