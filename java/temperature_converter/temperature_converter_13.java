/**
 * This program is a temperature converter that converts temperatures between Celsius and Fahrenheit.
 * It demonstrates the use of global variables and provides detailed comments for educational purposes.
 * The program includes functions to convert from Celsius to Fahrenheit and vice versa.
 */

public class TemperatureConverter {

    // Global variable to store the temperature value
    static double temperature;

    public static void main(String[] args) {
        // Example usage of the temperature converter
        temperature = 25.0; // Set the temperature to 25 degrees Celsius
        System.out.println("25 degrees Celsius is " + celsiusToFahrenheit() + " degrees Fahrenheit.");

        temperature = 77.0; // Set the temperature to 77 degrees Fahrenheit
        System.out.println("77 degrees Fahrenheit is " + fahrenheitToCelsius() + " degrees Celsius.");
    }

    /**
     * Converts the global temperature from Celsius to Fahrenheit.
     * 
     * @return The temperature in Fahrenheit.
     */
    public static double celsiusToFahrenheit() {
        // Formula to convert Celsius to Fahrenheit
        return (temperature * 9 / 5) + 32;
    }

    /**
     * Converts the global temperature from Fahrenheit to Celsius.
     * 
     * @return The temperature in Celsius.
     */
    public static double fahrenheitToCelsius() {
        // Formula to convert Fahrenheit to Celsius
        return (temperature - 32) * 5 / 9;
    }
}

