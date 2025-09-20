/**
 * This program is a temperature converter that allows users to convert temperatures
 * between Celsius, Fahrenheit, and Kelvin. The program provides a simple text-based
 * interface for users to input the temperature value and the desired conversion type.
 * It then performs the conversion and displays the result.
 */

import java.util.Scanner;

public class TemperatureConverter {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        boolean continueConversion = true;

        // Main loop to keep the program running until the user decides to exit
        while (continueConversion) {
            // Display the menu options to the user
            System.out.println("Temperature Converter");
            System.out.println("1. Celsius to Fahrenheit");
            System.out.println("2. Fahrenheit to Celsius");
            System.out.println("3. Celsius to Kelvin");
            System.out.println("4. Kelvin to Celsius");
            System.out.println("5. Fahrenheit to Kelvin");
            System.out.println("6. Kelvin to Fahrenheit");
            System.out.println("7. Exit");
            System.out.print("Choose an option: ");
            
            int choice = scanner.nextInt();
            double temperature;
            double convertedTemperature;

            // Perform the conversion based on the user's choice
            switch (choice) {
                case 1:
                    System.out.print("Enter temperature in Celsius: ");
                    temperature = scanner.nextDouble();
                    convertedTemperature = celsiusToFahrenheit(temperature);
                    System.out.println("Temperature in Fahrenheit: " + convertedTemperature);
                    break;
                case 2:
                    System.out.print("Enter temperature in Fahrenheit: ");
                    temperature = scanner.nextDouble();
                    convertedTemperature = fahrenheitToCelsius(temperature);
                    System.out.println("Temperature in Celsius: " + convertedTemperature);
                    break;
                case 3:
                    System.out.print("Enter temperature in Celsius: ");
                    temperature = scanner.nextDouble();
                    convertedTemperature = celsiusToKelvin(temperature);
                    System.out.println("Temperature in Kelvin: " + convertedTemperature);
                    break;
                case 4:
                    System.out.print("Enter temperature in Kelvin: ");
                    temperature = scanner.nextDouble();
                    convertedTemperature = kelvinToCelsius(temperature);
                    System.out.println("Temperature in Celsius: " + convertedTemperature);
                    break;
                case 5:
                    System.out.print("Enter temperature in Fahrenheit: ");
                    temperature = scanner.nextDouble();
                    convertedTemperature = fahrenheitToKelvin(temperature);
                    System.out.println("Temperature in Kelvin: " + convertedTemperature);
                    break;
                case 6:
                    System.out.print("Enter temperature in Kelvin: ");
                    temperature = scanner.nextDouble();
                    convertedTemperature = kelvinToFahrenheit(temperature);
                    System.out.println("Temperature in Fahrenheit: " + convertedTemperature);
                    break;
                case 7:
                    continueConversion = false;
                    break;
                default:
                    System.out.println("Invalid option. Please try again.");
            }
        }

        scanner.close();
    }

    // Method to convert Celsius to Fahrenheit
    public static double celsiusToFahrenheit(double celsius) {
        return (celsius * 9/5) + 32;
    }

    // Method to convert Fahrenheit to Celsius
    public static double fahrenheitToCelsius(double fahrenheit) {
        return (fahrenheit - 32) * 5/9;
    }

    // Method to convert Celsius to Kelvin
    public static double celsiusToKelvin(double celsius) {
        return celsius + 273.15;
    }

    // Method to convert Kelvin to Celsius
    public static double kelvinToCelsius(double kelvin) {
        return kelvin - 273.15;
    }

    // Method to convert Fahrenheit to Kelvin
    public static double fahrenheitToKelvin(double fahrenheit) {
        return (fahrenheit - 32) * 5/9 + 273.15;
    }

    // Method to convert Kelvin to Fahrenheit
    public static double kelvinToFahrenheit(double kelvin) {
        return (kelvin - 273.15) * 9/5 + 32;
    }
}

