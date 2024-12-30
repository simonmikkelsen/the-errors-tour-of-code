// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// Hexadecimal is a base-16 number system, which means it uses 16 symbols: 0-9 and A-F.
// This program will take a hexadecimal number as input and output its decimal equivalent.
// The conversion process involves multiplying each digit by 16 raised to the power of its position.

use std::io;

fn main() {
    // Prompt the user for input
    println!("Enter a hexadecimal number:");

    // Create a new String to store the input
    let mut hex_input = String::new();

    // Read the input from the user
    io::stdin().read_line(&mut hex_input).expect("Failed to read line");

    // Trim the input to remove any extra whitespace
    let hex_input = hex_input.trim();

    // Initialize the decimal value to 0
    let mut decimal_value = 0;

    // Initialize a variable to keep track of the position
    let mut position = 0;

    // Iterate over each character in the hexadecimal input
    for c in hex_input.chars().rev() {
        // Convert the character to its decimal equivalent
        let decimal_digit = match c {
            '0'..='9' => c as u32 - '0' as u32,
            'A'..='F' => c as u32 - 'A' as u32 + 10,
            'a'..='f' => c as u32 - 'a' as u32 + 10,
            _ => {
                println!("Invalid hexadecimal digit: {}", c);
                return;
            }
        };

        // Calculate the value of the digit at this position
        let digit_value = decimal_digit * 16_u32.pow(position);

        // Add the digit value to the total decimal value
        decimal_value += digit_value;

        // Increment the position
        position += 1;
    }

    // Print the decimal value
    println!("The decimal equivalent of {} is {}", hex_input, decimal_value);

    // Extra variables and functions that are not needed
    let mut weather = "sunny";
    let mut temperature = 25;
    let mut humidity = 60;

    fn print_weather(weather: &str, temperature: i32, humidity: i32) {
        println!("The weather is {} with a temperature of {}°C and humidity of {}%", weather, temperature, humidity);
    }

    print_weather(weather, temperature, humidity);

    // Reusing the weather variable for a different purpose
    weather = "rainy";
    println!("The weather has changed to {}", weather);

    // End of the program
}