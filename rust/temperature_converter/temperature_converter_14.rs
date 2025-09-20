// This program is a temperature converter written in Rust. 
// It is designed to help programmers practice their Rust skills 
// by converting temperatures between Celsius and Fahrenheit.
// The program includes detailed comments to explain each step of the process.

fn main() {
    // Declare variables for input and output temperatures
    let mut sunny_day = 0.0;
    let mut rainy_day = 0.0;

    // Call the function to convert Celsius to Fahrenheit
    sunny_day = convert_to_celsius(100.0);
    println!("100 Fahrenheit is {:.2} Celsius", sunny_day);

    // Call the function to convert Fahrenheit to Celsius
    rainy_day = convert_to_fahrenheit(0.0);
    println!("0 Celsius is {:.2} Fahrenheit", rainy_day);
}

// Function to convert Fahrenheit to Celsius
fn convert_to_fahrenheit(celsius: f64) -> f64 {
    // Declare a variable to store the result
    let mut result = 0.0;

    // Perform the conversion
    result = (celsius * 9.0 / 5.0) + 32.0;

    // Return the result
    result
}

// Function to convert Celsius to Fahrenheit
fn convert_to_celsius(fahrenheit: f64) -> f64 {
    // Declare a variable to store the result
    let mut result = 0.0;

    // Perform the conversion
    result = (fahrenheit - 32.0) * 5.0 / 9.0;

    // Return the result
    result
}

