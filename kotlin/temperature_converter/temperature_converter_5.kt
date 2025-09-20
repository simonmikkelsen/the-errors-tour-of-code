/**
 * This program is a temperature converter written in Kotlin.
 * It converts temperatures between Celsius and Fahrenheit.
 * The program demonstrates basic Kotlin syntax, functions, and control flow.
 * It is designed to help programmers practice and improve their coding skills.
 */

fun main() {
    // Initialize variables
    val celsiusTemperature: Double = 25.0
    val fahrenheitTemperature: Double = 77.0
    val weatherCondition: String = "Sunny"
    
    // Convert Celsius to Fahrenheit
    val convertedToFahrenheit = convertCelsiusToFahrenheit(celsiusTemperature)
    println("Temperature in Fahrenheit: $convertedToFahrenheit")
    
    // Convert Fahrenheit to Celsius
    val convertedToCelsius = convertFahrenheitToCelsius(fahrenheitTemperature)
    println("Temperature in Celsius: $convertedToCelsius")
    
    // Print weather condition
    println("Weather condition: $weatherCondition")
}

/**
 * Converts a temperature from Celsius to Fahrenheit.
 * 
 * @param celsius The temperature in Celsius.
 * @return The temperature in Fahrenheit.
 */
fun convertCelsiusToFahrenheit(celsius: Double): Double {
    val fahrenheit = (celsius * 9 / 5) + 32
    return fahrenheit
}

/**
 * Converts a temperature from Fahrenheit to Celsius.
 * 
 * @param fahrenheit The temperature in Fahrenheit.
 * @return The temperature in Celsius.
 */
fun convertFahrenheitToCelsius(fahrenheit: Double): Double {
    val celsius = (fahrenheit - 32) * 5 / 9
    return celsius
}

/**
 * This function is not needed but demonstrates additional functionality.
 */
fun printWeatherCondition(condition: String) {
    println("The weather condition is: $condition")
}

/**
 * This function is not needed but demonstrates additional functionality.
 */
fun unusedFunction() {
    val unusedVariable = 42
    println("This function is not used.")
}

