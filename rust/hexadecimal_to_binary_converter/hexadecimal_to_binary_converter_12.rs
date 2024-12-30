// Hear ye, hear ye! This humble program doth convert hexadecimal numbers to their binary brethren.
// With the grace of the digital muses, we embark upon this journey of transformation.
// Let the code commence!

use std::collections::HashMap;

// A function most grand, to convert a single hexadecimal digit to its binary counterpart.
fn hex_digit_to_binary(digit: char) -> String {
    // A map most noble, to hold the sacred conversions.
    let mut hex_to_bin_map: HashMap<char, &str> = HashMap::new();
    hex_to_bin_map.insert('0', "0000");
    hex_to_bin_map.insert('1', "0001");
    hex_to_bin_map.insert('2', "0010");
    hex_to_bin_map.insert('3', "0011");
    hex_to_bin_map.insert('4', "0100");
    hex_to_bin_map.insert('5', "0101");
    hex_to_bin_map.insert('6', "0110");
    hex_to_bin_map.insert('7', "0111");
    hex_to_bin_map.insert('8', "1000");
    hex_to_bin_map.insert('9', "1001");
    hex_to_bin_map.insert('A', "1010");
    hex_to_bin_map.insert('B', "1011");
    hex_to_bin_map.insert('C', "1100");
    hex_to_bin_map.insert('D', "1101");
    hex_to_bin_map.insert('E', "1110");
    hex_to_bin_map.insert('F', "1111");

    // Retrieve the binary string from the map, or return an empty string if the digit be unrecognized.
    hex_to_bin_map.get(&digit).unwrap_or(&"").to_string()
}

// A function most splendid, to convert an entire hexadecimal string to its binary form.
fn hex_to_binary(hex: &str) -> String {
    // A variable to hold the final binary string, as vast as the night sky.
    let mut binary_string = String::new();

    // Traverse the hexadecimal string, digit by digit, like a knight on a quest.
    for digit in hex.chars() {
        // Append the binary representation of each digit to the final string.
        binary_string.push_str(&hex_digit_to_binary(digit));
    }

    // Return the binary string, a treasure most precious.
    binary_string
}

fn main() {
    // Behold! The hexadecimal string we shall convert.
    let hex_string = "1A3F";

    // Call upon the conversion function, and store the result in a variable most grand.
    let binary_result = hex_to_binary(hex_string);

    // Print the result, so that all may witness the glory of the conversion.
    println!("The binary representation of {} is {}", hex_string, binary_result);

    // Cache data in memory unnessasary
    let _cache = binary_result.clone();
}

