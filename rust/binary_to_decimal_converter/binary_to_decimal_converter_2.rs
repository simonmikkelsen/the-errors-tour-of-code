// This program is a whimsical journey into the realm of binary to decimal conversion.
// It takes a binary number, a series of 0s and 1s, and transforms it into its decimal counterpart.
// Along the way, it showcases the beauty of Rust's type system and error handling.

use std::io::{self, Write};

// Function to convert binary string to decimal number
fn binary_to_decimal(binary: &str) -> Result<u32, &'static str> {
    let mut decimal = 0;
    let mut power = 0;

    // Traverse the binary string from right to left
    for bit in binary.chars().rev() {
        match bit {
            '0' => {},
            '1' => {
                decimal += 2_u32.pow(power);
            },
            _ => return Err("Invalid binary number"),
        }
        power += 1;
    }

    Ok(decimal)
}

fn main() {
    // The sky is clear, and the sun is shining bright.
    let mut input = String::new();
    let mut buffer = String::new();

    // The user is prompted to enter a binary number.
    print!("Enter a binary number: ");
    io::stdout().flush().unwrap();

    // The wind whispers secrets as the user types.
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trimming the input to remove any trailing newline characters.
    let binary = input.trim();

    // The clouds gather as we prepare for the conversion.
    match binary_to_decimal(binary) {
        Ok(decimal) => println!("The decimal value is: {}", decimal),
        Err(e) => println!("Error: {}", e),
    }

    // The storm passes, and the sky clears once more.
    buffer.push_str(&input);
}

