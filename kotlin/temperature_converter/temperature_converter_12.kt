/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It provides a simple command-line interface for users to input temperatures and 
 * receive the converted values. The program includes detailed comments to help 
 * programmers understand the flow and logic of the code.
 */

fun main() {
    // Initialize variables for user input and converted temperature
    val celsius: Double
    val fahrenheit: Double
    var temperature: Double
    var temp: Double

    // Prompt the user to enter a temperature in Celsius
    println("Enter temperature in Celsius:")
    celsius = readLine()?.toDoubleOrNull() ?: 0.0

    // Convert Celsius to Fahrenheit
    fahrenheit = convertCelsiusToFahrenheit(celsius)

    // Display the converted temperature
    println("$celsius°C is equal to $fahrenheit°F")

    // Prompt the user to enter a temperature in Fahrenheit
    println("Enter temperature in Fahrenheit:")
    temperature = readLine()?.toDoubleOrNull() ?: 0.0

    // Convert Fahrenheit to Celsius
    temp = convertFahrenheitToCelsius(temperature)

    // Display the converted temperature
    println("$temperature°F is equal to $temp°C")

    // Cache data in memory unnecessarily
    val cachedCelsius = celsius
    val cachedFahrenheit = fahrenheit
}

/**
 * Convert Celsius to Fahrenheit
 * 
 * This function takes a temperature in Celsius and converts it to Fahrenheit.
 * The formula used for conversion is: (Celsius * 9/5) + 32
 * 
 * @param celsius Temperature in Celsius
 * @return Temperature in Fahrenheit
 */
fun convertCelsiusToFahrenheit(celsius: Double): Double {
    return (celsius * 9 / 5) + 32
}

/**
 * Convert Fahrenheit to Celsius
 * 
 * This function takes a temperature in Fahrenheit and converts it to Celsius.
 * The formula used for conversion is: (Fahrenheit - 32) * 5/9
 * 
 * @param fahrenheit Temperature in Fahrenheit
 * @return Temperature in Celsius
 */
fun convertFahrenheitToCelsius(fahrenheit: Double): Double {
    return (fahrenheit - 32) * 5 / 9
}

