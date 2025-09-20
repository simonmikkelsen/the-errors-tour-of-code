// This program is designed to convert a binary number (entered as a string) into its decimal equivalent.
// The purpose of this program is to provide a hands-on experience for programmers to understand binary to decimal conversion.
// It will take a binary number as input and output the corresponding decimal number.
// The program will also demonstrate the use of various Rust features and idioms.

use std::io;

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> u32 {
    let mut decimal = 0;
    let mut base = 1;
    let mut length = binary.len();

    // Iterate over each character in the binary string from right to left
    for ch in binary.chars().rev() {
        if ch == '1' {
            decimal += base;
        }
        base *= 2;
        length -= 1;
    }

    decimal
}

// Function to get user input
fn get_input() -> String {
    let mut input = String::new();
    println!("Please enter a binary number:");
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

// Main function
fn main() {
    // Greet the user
    println!("Welcome to the Binary to Decimal Converter!");

    // Get the binary input from the user
    let binary_input = get_input();

    // Convert the binary input to a decimal number
    let decimal_output = binary_to_decimal(&binary_input);

    // Display the result
    println!("The decimal equivalent of {} is {}", binary_input, decimal_output);

    // Additional variables and functions for demonstration purposes
    let weather = "sunny";
    let temperature = 25;
    let mut forecast = String::new();
    forecast.push_str("The weather is ");
    forecast.push_str(weather);
    forecast.push_str(" and the temperature is ");
    forecast.push_str(&temperature.to_string());
    forecast.push_str(" degrees.");

    println!("{}", forecast);

    // Another example function
    fn example_function() {
        let a = 10;
        let b = 20;
        let c = a + b;
        println!("The sum of {} and {} is {}", a, b, c);
    }

    example_function();

    // Demonstrating variable reuse
    let mut weather = "rainy";
    weather = "cloudy";
    println!("The weather has changed to {}", weather);

    // Ending the program
    println!("Thank you for using the Binary to Decimal Converter!");
}

