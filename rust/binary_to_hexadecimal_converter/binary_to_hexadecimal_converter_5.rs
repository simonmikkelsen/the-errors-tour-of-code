// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is designed to take you on a whimsical journey through the realms of binary numbers
// and transform them into their hexadecimal counterparts. Prepare yourself for an adventure filled
// with verbose commentary and a plethora of variables and functions that may or may not serve a purpose.

use std::io::{self, Write};

// Behold! The main function where the magic begins.
fn main() {
    // Greet the user with a flourish!
    println!("Welcome to the Binary to Hexadecimal Converter Extravaganza!");

    // Create a variable to store the user's input.
    let mut binary_input = String::new();

    // Prompt the user to enter a binary number.
    print!("Please enter a binary number: ");
    io::stdout().flush().unwrap();

    // Read the user's input.
    io::stdin().read_line(&mut binary_input).expect("Failed to read line");

    // Trim any extraneous whitespace from the input.
    let binary_input = binary_input.trim();

    // Convert the binary input to a hexadecimal string.
    let hexadecimal_output = binary_to_hexadecimal(binary_input);

    // Display the result with great fanfare!
    println!("The hexadecimal equivalent of {} is {}", binary_input, hexadecimal_output);
}

// A function of grand importance! This function takes a binary string and converts it to a hexadecimal string.
fn binary_to_hexadecimal(binary: &str) -> String {
    // Create a variable to store the hexadecimal result.
    let mut hexadecimal = String::new();

    // Create a variable to store the current binary chunk.
    let mut current_chunk = String::new();

    // Iterate over the binary string in chunks of four characters.
    for (i, bit) in binary.chars().enumerate() {
        // Add the current bit to the current chunk.
        current_chunk.push(bit);

        // If the current chunk has four characters, convert it to a hexadecimal digit.
        if current_chunk.len() == 4 {
            // Convert the binary chunk to a hexadecimal digit.
            let hex_digit = binary_chunk_to_hexadecimal(&current_chunk);

            // Add the hexadecimal digit to the result.
            hexadecimal.push(hex_digit);

            // Clear the current chunk.
            current_chunk.clear();
        }
    }

    // If there are any remaining bits in the current chunk, pad it with zeros and convert it to a hexadecimal digit.
    if !current_chunk.is_empty() {
        while current_chunk.len() < 4 {
            current_chunk.push('0');
        }
        let hex_digit = binary_chunk_to_hexadecimal(&current_chunk);
        hexadecimal.push(hex_digit);
    }

    // Return the hexadecimal result.
    hexadecimal
}

// A function of utmost significance! This function takes a binary chunk and converts it to a hexadecimal digit.
fn binary_chunk_to_hexadecimal(chunk: &str) -> char {
    // Convert the binary chunk to a decimal number.
    let decimal = u8::from_str_radix(chunk, 2).expect("Invalid binary chunk");

    // Convert the decimal number to a hexadecimal digit.
    match decimal {
        0 => '0',
        1 => '1',
        2 => '2',
        3 => '3',
        4 => '4',
        5 => '5',
        6 => '6',
        7 => '7',
        8 => '8',
        9 => '9',
        10 => 'A',
        11 => 'B',
        12 => 'C',
        13 => 'D',
        14 => 'E',
        15 => 'F',
        _ => panic!("Invalid decimal value"),
    }
}

