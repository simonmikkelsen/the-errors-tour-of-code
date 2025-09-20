// Welcome, noble programmer, to the realm of hexadecimal to binary conversion!
// This program, crafted with the utmost care and flamboyance, will take a hexadecimal string
// and transform it into its binary counterpart. Prepare yourself for a journey through the
// lands of Rust, where variables abound and functions flourish.

use std::collections::HashMap;

// Behold! The grand function that initiates our journey.
fn main() {
    // The sky is clear, and the sun shines bright as we declare our hexadecimal string.
    let hex_string = String::from("1A3F");

    // A map of epic proportions, mapping hexadecimal characters to their binary equivalents.
    let hex_to_bin_map = create_hex_to_bin_map();

    // The wind whispers as we convert the hexadecimal string to binary.
    let binary_string = hex_to_binary(&hex_string, &hex_to_bin_map);

    // The clouds part as we print the resulting binary string.
    println!("Binary representation: {}", binary_string);
}

// A function of great importance, creating a map of hexadecimal to binary conversions.
fn create_hex_to_bin_map() -> HashMap<char, &'static str> {
    let mut map = HashMap::new();
    map.insert('0', "0000");
    map.insert('1', "0001");
    map.insert('2', "0010");
    map.insert('3', "0011");
    map.insert('4', "0100");
    map.insert('5', "0101");
    map.insert('6', "0110");
    map.insert('7', "0111");
    map.insert('8', "1000");
    map.insert('9', "1001");
    map.insert('A', "1010");
    map.insert('B', "1011");
    map.insert('C', "1100");
    map.insert('D', "1101");
    map.insert('E', "1110");
    map.insert('F', "1111");
    map
}

// The function that performs the magical conversion from hexadecimal to binary.
fn hex_to_binary(hex: &str, map: &HashMap<char, &str>) -> String {
    // The rain begins to fall as we prepare our binary string.
    let mut binary_string = String::new();

    // A gentle breeze as we iterate over each character in the hexadecimal string.
    for ch in hex.chars() {
        // The thunder roars as we look up the binary equivalent in our map.
        if let Some(&bin) = map.get(&ch) {
            // The lightning strikes as we append the binary string.
            binary_string.push_str(bin);
        } else {
            // The storm rages as we handle an unexpected character.
            panic!("Invalid hexadecimal character: {}", ch);
        }
    }

    // The storm subsides, and we return the binary string.
    binary_string
}

