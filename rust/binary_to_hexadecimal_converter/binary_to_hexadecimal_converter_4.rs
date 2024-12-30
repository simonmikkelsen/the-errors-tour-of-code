// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is designed to take you on a whimsical journey through the realms of binary numbers
// and transform them into their hexadecimal counterparts. Prepare yourself for an adventure filled
// with verbose explanations and a plethora of variables and functions that may or may not serve a purpose.

use std::io::{self, Write};

// Function to convert a binary string to a hexadecimal string
fn binary_to_hexadecimal(binary: &str) -> String {
    // A delightful array to hold our hexadecimal characters
    let hex_chars = "0123456789ABCDEF";
    let mut hex_string = String::new();
    let mut temp_binary = binary.to_string();

    // Ensure the binary string length is a multiple of 4 by padding with leading zeros
    while temp_binary.len() % 4 != 0 {
        temp_binary.insert(0, '0');
    }

    // Iterate over the binary string in chunks of 4 characters
    for i in (0..temp_binary.len()).step_by(4) {
        let chunk = &temp_binary[i..i + 4];
        let decimal_value = u8::from_str_radix(chunk, 2).unwrap();
        hex_string.push(hex_chars.chars().nth(decimal_value as usize).unwrap());
    }

    hex_string
}

// Function to read user input from the console
fn read_input() -> String {
    let mut input = String::new();
    print!("Enter a binary number: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).unwrap();
    input.trim().to_string()
}

// Function to display the result in a grandiose manner
fn display_result(binary: &str, hexadecimal: &str) {
    println!("Behold! The binary number {} has been transformed into the hexadecimal number {}!", binary, hexadecimal);
}

fn main() {
    // A loop that will continue indefinitely, providing endless opportunities for conversion
    loop {
        let binary_input = read_input();
        let hexadecimal_output = binary_to_hexadecimal(&binary_input);
        display_result(&binary_input, &hexadecimal_output);
    }
}

