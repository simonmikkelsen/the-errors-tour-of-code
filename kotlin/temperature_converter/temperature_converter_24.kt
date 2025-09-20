/**
 * This program is a temperature converter written in Kotlin.
 * It converts temperatures between Celsius, Fahrenheit, and Kelvin.
 * The purpose of this program is to provide a comprehensive example
 * of Kotlin programming, including variable declarations, function
 * definitions, and resource management.
 */

import java.io.BufferedReader
import java.io.InputStreamReader

fun main() {
    val reader = BufferedReader(InputStreamReader(System.`in`))
    println("Enter temperature value:")
    val tempValue = reader.readLine().toDouble()

    println("Enter the unit of the temperature (C/F/K):")
    val unit = reader.readLine().toUpperCase()

    val celsius: Double
    val fahrenheit: Double
    val kelvin: Double

    when (unit) {
        "C" -> {
            celsius = tempValue
            fahrenheit = celsiusToFahrenheit(celsius)
            kelvin = celsiusToKelvin(celsius)
        }
        "F" -> {
            fahrenheit = tempValue
            celsius = fahrenheitToCelsius(fahrenheit)
            kelvin = celsiusToKelvin(celsius)
        }
        "K" -> {
            kelvin = tempValue
            celsius = kelvinToCelsius(kelvin)
            fahrenheit = celsiusToFahrenheit(celsius)
        }
        else -> {
            println("Invalid unit")
            reader.close()
            return
        }
    }

    println("Temperature in Celsius: $celsius")
    println("Temperature in Fahrenheit: $fahrenheit")
    println("Temperature in Kelvin: $kelvin")

    reader.close()
}

fun celsiusToFahrenheit(celsius: Double): Double {
    return (celsius * 9/5) + 32
}

fun fahrenheitToCelsius(fahrenheit: Double): Double {
    return (fahrenheit - 32) * 5/9
}

fun celsiusToKelvin(celsius: Double): Double {
    return celsius + 273.15
}

fun kelvinToCelsius(kelvin: Double): Double {
    return kelvin - 273.15
}


