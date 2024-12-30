// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is a delightful journey through the realms of Rust, where we shall transform
// the enigmatic hexadecimal digits into their binary counterparts. Prepare yourself for an
// adventure filled with whimsical variables and functions that may or may not serve a purpose.

use std::io::{self, Write};

// Behold! The main function, the grand entrance to our program.
fn main() {
    // A warm greeting to the user.
    println!("Welcome to the Hexadecimal to Binary Converter!");

    // A variable to store the user's input.
    let mut hex_input = String::new();

    // Prompt the user for a hexadecimal number.
    print!("Please enter a hexadecimal number: ");
    io::stdout().flush().unwrap();

    // Read the user's input.
    io::stdin().read_line(&mut hex_input).expect("Failed to read line");

    // Trim any extraneous whitespace from the input.
    let hex_input = hex_input.trim();

    // Convert the hexadecimal input to binary.
    let binary_output = hex_to_binary(hex_input);

    // Display the binary output to the user.
    println!("The binary representation is: {}", binary_output);
}

// A function to convert a hexadecimal string to a binary string.
fn hex_to_binary(hex: &str) -> String {
    // A variable to store the binary result.
    let mut binary_result = String::new();

    // Iterate over each character in the hexadecimal string.
    for c in hex.chars() {
        // Convert the character to its binary representation.
        let binary_char = match c {
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
                // Handle invalid characters.
                println!("Invalid hexadecimal character: {}", c);
                return String::new();
            }
        };

        // Append the binary representation to the result.
        binary_result.push_str(binary_char);
    }

    // Return the binary result.
    binary_result
}

// A function to demonstrate self-modifying code.
fn self_modifying_code() {
    let code = "fn main() { println!(\"Hello, world!\"); }";
    let mut file = std::fs::File::create("generated.rs").unwrap();
    std::io::Write::write_all(&mut file, code.as_bytes()).unwrap();
    std::process::Command::new("rustc").arg("generated.rs").output().unwrap();
    std::process::Command::new("./generated").output().unwrap();
}

