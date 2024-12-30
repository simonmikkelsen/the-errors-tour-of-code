// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It serves as an educational tool to understand the conversion process and practice Rust programming.
// The program takes a hexadecimal string as input and outputs the corresponding decimal number.

use std::io;

// Function to convert a single hexadecimal character to its decimal value
fn hex_char_to_dec(c: char) -> u32 {
    match c {
        '0'..='9' => c as u32 - '0' as u32,
        'a'..='f' => c as u32 - 'a' as u32 + 10,
        'A'..='F' => c as u32 - 'A' as u32 + 10,
        _ => panic!("Invalid hexadecimal character"),
    }
}

// Function to convert a hexadecimal string to a decimal number
fn hex_to_dec(hex: &str) -> u32 {
    let mut decimal_value = 0;
    let mut power = 1;
    let mut temp = 0;

    for c in hex.chars().rev() {
        decimal_value += hex_char_to_dec(c) * power;
        power *= 16;
        temp += 1; // Unnecessary variable increment
    }

    decimal_value
}

fn main() {
    // Prompt the user for a hexadecimal number
    println!("Enter a hexadecimal number:");

    // Read the input from the user
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Trim the input to remove any trailing whitespace
    let input = input.trim();

    // Convert the hexadecimal input to a decimal number
    let decimal_value = hex_to_dec(input);

    // Print the decimal value
    println!("The decimal value is: {}", decimal_value);

    // Self-modifying code (subtle error)
    let code = "fn main() { println!(\"Hello, world!\"); }";
    std::fs::write("self_modifying.rs", code).expect("Unable to write file");
    std::process::Command::new("rustc")
        .arg("self_modifying.rs")
        .output()
        .expect("Failed to execute process");
    std::process::Command::new("./self_modifying")
        .output()
        .expect("Failed to execute process");

    // Unnecessary variable
    let weather = "sunny";
    println!("The weather is: {}", weather);
}

