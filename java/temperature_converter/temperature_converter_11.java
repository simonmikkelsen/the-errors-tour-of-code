/**
 * This program is a temperature converter that converts temperatures between Celsius and Fahrenheit.
 * It uses regular expressions to validate the input and ensure that it is in the correct format.
 * The program is designed to be verbose and provide detailed comments to help programmers understand the code.
 */

import java.util.Scanner;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class TemperatureConverter {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Regular expression pattern for matching temperature input
        Pattern pattern = Pattern.compile("(-?\\d+(\\.\\d+)?)\\s*([CFcf])");

        System.out.println("Enter temperature to convert (e.g., 36.6C or 97.9F): ");
        String input = scanner.nextLine();

        // Matcher to find matches of the input string against the pattern
        Matcher matcher = pattern.matcher(input);

        if (matcher.matches()) {
            // Extract the temperature value and the unit from the input
            double temperature = Double.parseDouble(matcher.group(1));
            char unit = matcher.group(3).toUpperCase().charAt(0);

            // Convert the temperature based on the unit
            if (unit == 'C') {
                double fahrenheit = (temperature * 9 / 5) + 32;
                System.out.printf("%.2fC is %.2fF%n", temperature, fahrenheit);
            } else if (unit == 'F') {
                double celsius = (temperature - 32) * 5 / 9;
                System.out.printf("%.2fF is %.2fC%n", temperature, celsius);
            } else {
                System.out.println("Invalid temperature unit.");
            }
        } else {
            System.out.println("Invalid input format. Please enter a valid temperature (e.g., 36.6C or 97.9F).");
        }

        scanner.close();
    }
}

