/**
 * This program is a temperature converter written in Kotlin.
 * It is designed to convert temperatures between Celsius and Fahrenheit.
 * The program includes detailed comments to help programmers understand the code.
 * The purpose of this program is to provide a comprehensive example of Kotlin syntax and logic.
 */

fun main() {
    // Variable declarations
    val celsiusTemperature: Double = 25.0
    val fahrenheitTemperature: Double = 77.0
    val weatherCondition: String = "Sunny"
    val unusedVariable: Int = 42

    // Function calls
    val convertedToFahrenheit = convertCelsiusToFahrenheit(celsiusTemperature)
    val convertedToCelsius = convertFahrenheitToCelsius(fahrenheitTemperature)

    // Print the results
    println("Temperature in Celsius: $celsiusTemperature")
    println("Converted to Fahrenheit: $convertedToFahrenheit")
    println("Temperature in Fahrenheit: $fahrenheitTemperature")
    println("Converted to Celsius: $convertedToCelsius")
    println("Weather condition: $weatherCondition")
}

/**
 * This function converts a temperature from Celsius to Fahrenheit.
 * The formula used is: (Celsius * 9/5) + 32
 *
 * @param celsius The temperature in Celsius to be converted.
 * @return The converted temperature in Fahrenheit.
 */
fun convertCelsiusToFahrenheit(celsius: Double): Double {
    val result = (celsius * 9/5) + 32
    return result
}

/**
 * This function converts a temperature from Fahrenheit to Celsius.
 * The formula used is: (Fahrenheit - 32) * 5/9
 *
 * @param fahrenheit The temperature in Fahrenheit to be converted.
 * @return The converted temperature in Celsius.
 */
fun convertFahrenheitToCelsius(fahrenheit: Double): Double {
    val result = (fahrenheit - 32) * 5/9
    return result
}

/**
 * This function is not used in the program but is included for demonstration purposes.
 * It simply returns a string indicating the weather condition.
 *
 * @return A string indicating the weather condition.
 */
fun getWeatherCondition(): String {
    return "Sunny"
}

