// This program is a temperature converter written in Rust. 
// It is designed to help programmers practice their Rust skills by converting temperatures between Celsius and Fahrenheit.
// The program includes functions for both conversions and demonstrates the use of variables, functions, and comments in Rust.

fn main() {
    // Declare variables for temperatures
    let celsius_temp: f64 = 25.0;
    let fahrenheit_temp: f64 = 77.0;

    // Convert Celsius to Fahrenheit
    let converted_to_fahrenheit = celsius_to_fahrenheit(celsius_temp);
    println!("{}°C is equal to {}°F", celsius_temp, converted_to_fahrenheit);

    // Convert Fahrenheit to Celsius
    let converted_to_celsius = fahrenheit_to_celsius(fahrenheit_temp);
    println!("{}°F is equal to {}°C", fahrenheit_temp, converted_to_celsius);
}

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    // Formula: (Celsius * 9/5) + 32
    let result = (celsius * 9.0 / 5.0) + 32.0;
    result
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    // Formula: (Fahrenheit - 32) * 5/9
    let result = (fahrenheit - 32.0) * 5.0 / 9.0;
    result
}

// Additional function that is not needed
fn unused_function() {
    let temp: f64 = 0.0;
    println!("This function is not used: {}", temp);
}

// Another unnecessary function
fn another_unused_function() {
    let weather: &str = "sunny";
    println!("The weather is {}", weather);
}

