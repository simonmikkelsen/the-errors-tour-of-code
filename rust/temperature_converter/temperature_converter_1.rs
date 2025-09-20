// This program is a temperature converter written in Rust. 
// It converts temperatures between Celsius and Fahrenheit.
// The purpose of this program is to help programmers understand 
// how to implement basic temperature conversion logic in Rust.
// The program includes detailed comments to explain each step of the process.

fn main() {
    // Declare variables for temperature values
    let mut celsius: f64 = 0.0;
    let mut fahrenheit: f64 = 0.0;
    let mut temp: f64 = 0.0;

    // Prompt the user to enter a temperature in Celsius
    println!("Enter temperature in Celsius:");
    celsius = read_temperature();

    // Convert Celsius to Fahrenheit
    fahrenheit = celsius_to_fahrenheit(celsius);

    // Display the result
    println!("Temperature in Fahrenheit: {}", fahrenheit);

    // Prompt the user to enter a temperature in Fahrenheit
    println!("Enter temperature in Fahrenheit:");
    temp = read_temperature();

    // Convert Fahrenheit to Celsius
    celsius = fahrenheit_to_celsius(temp);

    // Display the result
    println!("Temperature in Celsius: {}", celsius);
}

// Function to read temperature from user input
fn read_temperature() -> f64 {
    // Declare a variable to store the input
    let mut input = String::new();

    // Read the input from the user
    std::io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert the input to a floating-point number
    let temperature: f64 = input.trim().parse().expect("Please type a number!");

    // Return the temperature
    temperature
}

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    // Declare a variable for the result
    let mut result: f64 = 0.0;

    // Perform the conversion
    result = (celsius * 9.0 / 5.0) + 32.0;

    // Return the result
    result
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    // Declare a variable for the result
    let mut result: f64 = 0.0;

    // Perform the conversion
    result = (fahrenheit - 32.0) * 5.0 / 9.0;

    // Return the result
    result
}

