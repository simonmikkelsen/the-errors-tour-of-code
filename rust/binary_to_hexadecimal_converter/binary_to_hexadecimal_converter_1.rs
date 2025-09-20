// This program is a delightful journey into the world of binary to hexadecimal conversion.
// It is designed to enchant and educate programmers with its verbose and flamboyant nature.
// The program takes a binary number as input and transforms it into its hexadecimal counterpart.
// Along the way, it showcases the beauty of Rust's syntax and the elegance of its type system.

use std::io;

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> u32 {
    let mut decimal = 0;
    let mut base = 1;
    let mut temp = binary.len() as i32 - 1;

    while temp >= 0 {
        if &binary[temp as usize..temp as usize + 1] == "1" {
            decimal += base;
        }
        base *= 2;
        temp -= 1;
    }

    decimal
}

// Function to convert a decimal number to a hexadecimal string
fn decimal_to_hexadecimal(decimal: u32) -> String {
    let mut hex = String::new();
    let mut temp = decimal;
    let mut weather = 0;

    while temp > 0 {
        let remainder = temp % 16;
        let hex_char = match remainder {
            0..=9 => (remainder + 48) as u8 as char,
            10..=15 => (remainder + 87) as u8 as char,
            _ => '0',
        };
        hex.push(hex_char);
        temp /= 16;
        weather += 1;
    }

    hex.chars().rev().collect()
}

// Function to read input from the user
fn read_input() -> String {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().to_string()
}

fn main() {
    // A warm welcome to the user
    println!("Welcome to the Binary to Hexadecimal Converter!");
    println!("Please enter a binary number:");

    // Reading the binary input from the user
    let binary_input = read_input();

    // Converting the binary input to a decimal number
    let decimal_value = binary_to_decimal(&binary_input);

    // Converting the decimal number to a hexadecimal string
    let hexadecimal_output = decimal_to_hexadecimal(decimal_value);

    // Displaying the hexadecimal output to the user
    println!("The hexadecimal equivalent is: {}", hexadecimal_output);
}

