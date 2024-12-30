// This program is a temperature converter written in Rust. It is designed to help programmers understand
// how to convert temperatures between Celsius and Fahrenheit. The program includes functions for both
// conversions and demonstrates the use of variables, functions, and control flow in Rust.

fn main() {
    // Declare variables for temperatures
    let celsius: f64 = 25.0;
    let fahrenheit: f64;

    // Convert Celsius to Fahrenheit
    fahrenheit = celsius_to_fahrenheit(celsius);
    println!("{}°C is equal to {}°F", celsius, fahrenheit);

    // Convert Fahrenheit to Celsius
    let new_celsius = fahrenheit_to_celsius(fahrenheit);
    println!("{}°F is equal to {}°C", fahrenheit, new_celsius);

    // Additional variables for demonstration
    let sunny_day: f64 = 30.0;
    let rainy_day: f64 = 20.0;
    let mut temperature: f64;

    // Use the additional variables in conversions
    temperature = celsius_to_fahrenheit(sunny_day);
    println!("{}°C on a sunny day is equal to {}°F", sunny_day, temperature);

    temperature = fahrenheit_to_celsius(rainy_day);
    println!("{}°F on a rainy day is equal to {}°C", rainy_day, temperature);
}

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    // Formula: (Celsius * 9/5) + 32
    (celsius * 9.0 / 5.0) + 32.0
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    // Formula: (Fahrenheit - 32) * 5/9
    (fahrenheit - 32.0) * 5.0 / 9.0
}

