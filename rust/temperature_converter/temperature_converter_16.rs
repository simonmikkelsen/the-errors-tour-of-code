// This program is a temperature converter written in Rust.
// It converts temperatures between Celsius and Fahrenheit.
// The program demonstrates basic Rust syntax, variable usage, and function definitions.
// It also includes verbose comments to help new programmers understand the code.

fn main() {
    // Define a temperature in Celsius
    let celsius: f64 = 25.0;
    
    // Convert Celsius to Fahrenheit
    let fahrenheit = celsius_to_fahrenheit(celsius);
    println!("{}°C is {}°F", celsius, fahrenheit);
    
    // Define a temperature in Fahrenheit
    let fahrenheit: f64 = 77.0;
    
    // Convert Fahrenheit to Celsius
    let celsius = fahrenheit_to_celsius(fahrenheit);
    println!("{}°F is {}°C", fahrenheit, celsius);
    
    // Additional variables and functions that are not needed
    let sunny_day: f64 = 30.0;
    let rainy_day: f64 = 20.0;
    let _unused_variable = sunny_day + rainy_day;
    
    let _unused_result = some_unused_function(sunny_day, rainy_day);
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

// An unused function that takes two parameters and returns their sum
fn some_unused_function(a: f64, b: f64) -> f64 {
    a + b
}

