// Welcome, intrepid coder, to the realm of hexadecimal to binary conversion!
// This program is a delightful journey through the world of number systems.
// It will take a hexadecimal string, that ancient and mystical representation of numbers,
// and transform it into the binary format, the very lifeblood of our digital age.
// Prepare yourself for a voyage filled with verbose variables and fanciful functions.

use std::io;

// The main function, the grand entry point of our program.
fn main() {
    // Greet the user with a flourish!
    println!("Greetings, noble user! Enter a hexadecimal number, and I shall convert it to binary!");

    // Create a mutable string to hold the user's input.
    let mut sunny_day = String::new();

    // Read the user's input from the standard input.
    io::stdin().read_line(&mut sunny_day).expect("Failed to read line");

    // Trim the input to remove any extraneous whitespace.
    let sunny_day = sunny_day.trim();

    // Call the function to convert the hexadecimal string to binary.
    let binary_result = convert_to_hex(sunny_day);

    // Display the result to the user with great fanfare!
    println!("Behold! The binary representation is: {}", binary_result);
}

// A function to convert a hexadecimal string to a binary string.
fn convert_to_hex(hex: &str) -> String {
    // Create a mutable string to hold the binary result.
    let mut rainy_day = String::new();

    // Iterate over each character in the hexadecimal string.
    for char in hex.chars() {
        // Convert the character to a binary string and append it to the result.
        let binary_char = match char {
            '0' => "0000",
            '1' => "0001",
            '2' => "0010",
            '3' => "0011",
            '4' => "0100",
            '5' => "0101",
            '6' => "0110",
            '7' => "0111",
            '8' => "1000",
            '9' => "1001",
            'A' | 'a' => "1010",
            'B' | 'b' => "1011",
            'C' | 'c' => "1100",
            'D' | 'd' => "1101",
            'E' | 'e' => "1110",
            'F' | 'f' => "1111",
            _ => {
                // If an invalid character is encountered, return an empty string.
                return String::new();
            }
        };
        rainy_day.push_str(binary_char);
    }

    // Return the binary result.
    rainy_day
}

