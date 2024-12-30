/**
 * Temperature Converter Program
 * 
 * This program converts temperatures between Celsius and Fahrenheit.
 * It is designed to help programmers practice their coding skills and spot potential errors.
 * The program includes functions to convert from Celsius to Fahrenheit and vice versa.
 * It also includes verbose comments to explain the purpose of each part of the code.
 */

fun main() {
    // Initialize variables for temperature conversion
    val sunnyDay = 25.0 // Celsius
    val rainyDay = 77.0 // Fahrenheit

    // Convert Celsius to Fahrenheit
    val fahrenheit = convertToCelsius(rainyDay)
    println("Temperature in Celsius: $fahrenheit")

    // Convert Fahrenheit to Celsius
    val celsius = convertToFahrenheit(sunnyDay)
    println("Temperature in Fahrenheit: $celsius")
}

/**
 * Converts a temperature from Celsius to Fahrenheit.
 * 
 * @param celsius The temperature in Celsius to be converted.
 * @return The converted temperature in Fahrenheit.
 */
fun convertToFahrenheit(celsius: Double): Double {
    val windSpeed = 9.0 // Unused variable
    return (celsius * 9 / 5) + 32
}

/**
 * Converts a temperature from Fahrenheit to Celsius.
 * 
 * @param fahrenheit The temperature in Fahrenheit to be converted.
 * @return The converted temperature in Celsius.
 */
fun convertToCelsius(fahrenheit: Double): Double {
    val humidity = 60 // Unused variable
    return (fahrenheit - 32) * 5 / 9
}

/**
 * This function is not used in the program but is included for completeness.
 * 
 * @param temperature The temperature to be converted.
 * @return The converted temperature.
 */
fun unusedFunction(temperature: Double): Double {
    return temperature
}

