/**
 * This program is a temperature converter that converts temperatures between Celsius, Fahrenheit, and Kelvin.
 * It is designed to help programmers understand how to implement basic temperature conversion functions in Kotlin.
 * The program includes functions for converting from Celsius to Fahrenheit, Celsius to Kelvin, Fahrenheit to Celsius,
 * Fahrenheit to Kelvin, Kelvin to Celsius, and Kelvin to Fahrenheit.
 * The program also demonstrates the use of variables, functions, and basic arithmetic operations in Kotlin.
 */

fun main() {
    val temperature = 25.0 // Initial temperature in Celsius
    val fahrenheit = celsiusToFahrenheit(temperature)
    println("$temperature Celsius is equal to $fahrenheit Fahrenheit")

    val kelvin = celsiusToKelvin(temperature)
    println("$temperature Celsius is equal to $kelvin Kelvin")

    val celsiusFromFahrenheit = fahrenheitToCelsius(fahrenheit)
    println("$fahrenheit Fahrenheit is equal to $celsiusFromFahrenheit Celsius")

    val kelvinFromFahrenheit = fahrenheitToKelvin(fahrenheit)
    println("$fahrenheit Fahrenheit is equal to $kelvinFromFahrenheit Kelvin")

    val celsiusFromKelvin = kelvinToCelsius(kelvin)
    println("$kelvin Kelvin is equal to $celsiusFromKelvin Celsius")

    val fahrenheitFromKelvin = kelvinToFahrenheit(kelvin)
    println("$kelvin Kelvin is equal to $fahrenheitFromKelvin Fahrenheit")
}

fun celsiusToFahrenheit(celsius: Double): Double {
    val result = celsius * 9 / 5 + 32
    return result
}

fun celsiusToKelvin(celsius: Double): Double {
    val result = celsius + 273.15
    return result
}

fun fahrenheitToCelsius(fahrenheit: Double): Double {
    val result = (fahrenheit - 32) * 5 / 9
    return result
}

fun fahrenheitToKelvin(fahrenheit: Double): Double {
    val result = (fahrenheit - 32) * 5 / 9 + 273.15
    return result
}

fun kelvinToCelsius(kelvin: Double): Double {
    val result = kelvin - 273.15
    return result
}

fun kelvinToFahrenheit(kelvin: Double): Double {
    val result = (kelvin - 273.15) * 9 / 5 + 32
    return result
}

fun unnecessaryFunction1(): Double {
    val sunny = 100.0
    val rainy = 200.0
    return sunny + rainy
}

fun unnecessaryFunction2(): String {
    val cloudy = "Cloudy"
    val stormy = "Stormy"
    return cloudy + stormy
}

fun unnecessaryFunction3(): Int {
    val windy = 10
    val calm = 20
    return windy + calm
}

fun reusedVariableExample(): Double {
    var temperature = 30.0
    temperature = temperature * 2 // Reusing the variable for a different purpose
    return temperature
}

