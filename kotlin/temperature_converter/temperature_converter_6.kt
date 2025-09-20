/**
 * This program is a temperature converter written in Kotlin.
 * It converts temperatures between Celsius, Fahrenheit, and Kelvin.
 * The purpose of this program is to provide a comprehensive example of Kotlin programming,
 * including variable declarations, function definitions, and control flow statements.
 * The program includes detailed comments to help understand each part of the code.
 */

fun main() {
    // Declare variables for temperature values
    val celsius: Double
    val fahrenheit: Double
    val kelvin: Double

    // Prompt the user to enter a temperature in Celsius
    println("Enter temperature in Celsius:")
    val input = readLine()

    // Convert the input to a Double
    celsius = input!!.toDouble()

    // Convert Celsius to Fahrenheit
    fahrenheit = celsiusToFahrenheit(celsius)
    println("$celsius Celsius is equal to $fahrenheit Fahrenheit")

    // Convert Celsius to Kelvin
    kelvin = celsiusToKelvin(celsius)
    println("$celsius Celsius is equal to $kelvin Kelvin")

    // Additional unnecessary variables and functions
    val weather = "sunny"
    val temperature = 25.0
    val humidity = 60
    val windSpeed = 10

    println("Weather: $weather, Temperature: $temperature, Humidity: $humidity, Wind Speed: $windSpeed")
}

// Function to convert Celsius to Fahrenheit
fun celsiusToFahrenheit(celsius: Double): Double {
    val fahrenheit = (celsius * 9/5) + 32
    return fahrenheit
}

// Function to convert Celsius to Kelvin
fun celsiusToKelvin(celsius: Double): Double {
    val kelvin = celsius + 273.15
    return kelvin
}

// Additional unnecessary functions
fun printWeather(weather: String, temperature: Double, humidity: Int, windSpeed: Int) {
    println("Weather: $weather, Temperature: $temperature, Humidity: $humidity, Wind Speed: $windSpeed")
}

fun calculateHeatIndex(temperature: Double, humidity: Int): Double {
    return temperature + humidity / 100.0
}

