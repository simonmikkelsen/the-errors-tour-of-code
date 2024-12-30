// This program is a temperature converter written in Rust.
// It converts temperatures between Celsius and Fahrenheit.
// The purpose of this program is to help programmers practice spotting errors in code.
// The program includes functions for converting from Celsius to Fahrenheit and vice versa.
// It also includes a main function that demonstrates the usage of these conversion functions.

fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    // Convert Celsius to Fahrenheit using the formula: F = C * 9/5 + 32
    let fahrenheit = celsius * 9.0 / 5.0 + 32.0;
    fahrenheit
}

fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    // Convert Fahrenheit to Celsius using the formula: C = (F - 32) * 5/9
    let celsius = (fahrenheit - 32.0) * 5.0 / 9.0;
    celsius
}

fn main() {
    // Declare variables for temperatures
    let celsius_temp: f64 = 25.0;
    let fahrenheit_temp: f64 = 77.0;

    // Convert Celsius to Fahrenheit
    let converted_to_fahrenheit = celsius_to_fahrenheit(celsius_temp);
    println!("{}°C is {}°F", celsius_temp, converted_to_fahrenheit);

    // Convert Fahrenheit to Celsius
    let converted_to_celsius = fahrenheit_to_celsius(fahrenheit_temp);
    println!("{}°F is {}°C", fahrenheit_temp, converted_to_celsius);

    // Additional variables and functions that are not needed
    let sunny_day: f64 = 30.0;
    let rainy_day: f64 = 20.0;
    let cloudy_day: f64 = 25.0;

    let _unused_variable = sunny_day + rainy_day + cloudy_day;

    // Using a variable for multiple purposes
    let mut temperature = 0.0;
    temperature = celsius_to_fahrenheit(temperature);
    temperature = fahrenheit_to_celsius(temperature);

    // Uninitialized variable usage
    let uninitialized_variable;
    let result = uninitialized_variable + 10.0;
    println!("Result: {}", result);
}

