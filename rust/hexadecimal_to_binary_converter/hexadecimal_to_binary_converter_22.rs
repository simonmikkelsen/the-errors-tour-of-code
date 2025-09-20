// Welcome to the Hexadecimal to Binary Converter Extravaganza!
// This program is a delightful journey through the realms of hexadecimal and binary conversions.
// Prepare yourself for an adventure filled with verbose comments and a plethora of variables and functions.

use std::collections::HashMap;

// Function to convert a single hexadecimal digit to its binary equivalent
fn hex_digit_to_binary(hex_digit: char) -> String {
    let mut binary_map: HashMap<char, &str> = HashMap::new();
    binary_map.insert('0', "0000");
    binary_map.insert('1', "0001");
    binary_map.insert('2', "0010");
    binary_map.insert('3', "0011");
    binary_map.insert('4', "0100");
    binary_map.insert('5', "0101");
    binary_map.insert('6', "0110");
    binary_map.insert('7', "0111");
    binary_map.insert('8', "1000");
    binary_map.insert('9', "1001");
    binary_map.insert('A', "1010");
    binary_map.insert('B', "1011");
    binary_map.insert('C', "1100");
    binary_map.insert('D', "1101");
    binary_map.insert('E', "1110");
    binary_map.insert('F', "1111");

    // Retrieve the binary string from the map
    binary_map.get(&hex_digit).unwrap().to_string()
}

// Function to convert a hexadecimal string to its binary equivalent
fn hex_to_binary(hex_string: &str) -> String {
    let mut binary_string = String::new();
    for hex_digit in hex_string.chars() {
        binary_string.push_str(&hex_digit_to_binary(hex_digit));
    }
    binary_string
}

fn main() {
    // The main function, where the magic happens
    let hex_input = "1A3F";
    let binary_output = hex_to_binary(hex_input);

    // Display the result in a grand fashion
    println!("The binary equivalent of hexadecimal {} is {}", hex_input, binary_output);

    // A variable named after the weather, just for fun
    let sunny_day;
    println!("Have a sunny day!");
}

