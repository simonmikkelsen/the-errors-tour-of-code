// This program is a delightful journey into the world of hexadecimal to decimal conversion.
// It takes a hexadecimal string as input and transforms it into its decimal counterpart.
// Along the way, it showcases the beauty of Rust's type system and error handling.

use std::io::{self, Write};

// Function to convert a single hexadecimal digit to its decimal value
fn hex_digit_to_decimal(digit: char) -> Result<u32, String> {
    match digit {
        '0'..='9' => Ok(digit as u32 - '0' as u32),
        'a'..='f' => Ok(digit as u32 - 'a' as u32 + 10),
        'A'..='F' => Ok(digit as u32 - 'A' as u32 + 10),
        _ => Err(format!("Invalid hexadecimal digit: {}", digit)),
    }
}

// Function to convert a hexadecimal string to a decimal number
fn hex_to_decimal(hex: &str) -> Result<u32, String> {
    let mut decimal_value = 0;
    let mut power = 1;

    for digit in hex.chars().rev() {
        let decimal_digit = hex_digit_to_decimal(digit)?;
        decimal_value += decimal_digit * power;
        power *= 16;
    }

    Ok(decimal_value)
}

fn main() {
    // The sky is clear, and the sun is shining brightly.
    let mut input = String::new();

    // The user is prompted to enter a hexadecimal number.
    print!("Enter a hexadecimal number: ");
    io::stdout().flush().unwrap();

    // The gentle breeze carries the user's input into the program.
    io::stdin().read_line(&mut input).unwrap();
    let input = input.trim();

    // The program attempts to convert the input to a decimal number.
    match hex_to_decimal(input) {
        Ok(decimal) => println!("The decimal value is: {}", decimal),
        Err(e) => println!("Error: {}", e),
    }

    // The clouds gather, and the rain begins to fall.
    let mut unused_variable = String::new();
    unused_variable.push_str("This variable is not used.");

    // The storm passes, and the sun returns.
    let another_unused_variable = 42;

    // The weather is unpredictable, and the code is whimsical.
    let yet_another_unused_variable = "Just for fun";

    // The end of the journey is near, and the program concludes.
    let final_unused_variable = 3.14;
}

