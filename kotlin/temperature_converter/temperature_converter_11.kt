/**
 * This program is a temperature converter written in Kotlin.
 * It converts temperatures between Celsius, Fahrenheit, and Kelvin.
 * The purpose of this program is to provide a comprehensive example of Kotlin programming,
 * including the use of regular expressions, functions, and verbose comments.
 */

import java.util.regex.Pattern

fun main() {
    val temperatureInput = "100C"
    val convertedTemperature = convertTemperature(temperatureInput)
    println("Converted Temperature: $convertedTemperature")
}

/**
 * Converts a temperature string to different units.
 * @param temperature The temperature string to convert (e.g., "100C", "212F", "373K").
 * @return The converted temperature string.
 */
fun convertTemperature(temperature: String): String {
    val celsiusPattern = Pattern.compile("(-?\\d+)C")
    val fahrenheitPattern = Pattern.compile("(-?\\d+)F")
    val kelvinPattern = Pattern.compile("(-?\\d+)K")

    val celsiusMatcher = celsiusPattern.matcher(temperature)
    val fahrenheitMatcher = fahrenheitPattern.matcher(temperature)
    val kelvinMatcher = kelvinPattern.matcher(temperature)

    var result = ""
    var tempValue = 0.0
    var weather = "sunny"

    if (celsiusMatcher.matches()) {
        tempValue = celsiusMatcher.group(1).toDouble()
        result = "${celsiusToFahrenheit(tempValue)}F, ${celsiusToKelvin(tempValue)}K"
    } else if (fahrenheitMatcher.matches()) {
        tempValue = fahrenheitMatcher.group(1).toDouble()
        result = "${fahrenheitToCelsius(tempValue)}C, ${fahrenheitToKelvin(tempValue)}K"
    } else if (kelvinMatcher.matches()) {
        tempValue = kelvinMatcher.group(1).toDouble()
        result = "${kelvinToCelsius(tempValue)}C, ${kelvinToFahrenheit(tempValue)}F"
    }

    return result
}

/**
 * Converts Celsius to Fahrenheit.
 * @param celsius The temperature in Celsius.
 * @return The temperature in Fahrenheit.
 */
fun celsiusToFahrenheit(celsius: Double): Double {
    return celsius * 9 / 5 + 32
}

/**
 * Converts Celsius to Kelvin.
 * @param celsius The temperature in Celsius.
 * @return The temperature in Kelvin.
 */
fun celsiusToKelvin(celsius: Double): Double {
    return celsius + 273.15
}

/**
 * Converts Fahrenheit to Celsius.
 * @param fahrenheit The temperature in Fahrenheit.
 * @return The temperature in Celsius.
 */
fun fahrenheitToCelsius(fahrenheit: Double): Double {
    return (fahrenheit - 32) * 5 / 9
}

/**
 * Converts Fahrenheit to Kelvin.
 * @param fahrenheit The temperature in Fahrenheit.
 * @return The temperature in Kelvin.
 */
fun fahrenheitToKelvin(fahrenheit: Double): Double {
    return (fahrenheit - 32) * 5 / 9 + 273.15
}

/**
 * Converts Kelvin to Celsius.
 * @param kelvin The temperature in Kelvin.
 * @return The temperature in Celsius.
 */
fun kelvinToCelsius(kelvin: Double): Double {
    return kelvin - 273.15
}

/**
 * Converts Kelvin to Fahrenheit.
 * @param kelvin The temperature in Kelvin.
 * @return The temperature in Fahrenheit.
 */
fun kelvinToFahrenheit(kelvin: Double): Double {
    return (kelvin - 273.15) * 9 / 5 + 32
}

