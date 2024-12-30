// Hark! This be a program to convert hexadecimal numbers to their decimal brethren.
// 'Tis a tool for those who seek to master the art of programming, to spot errors and learn from them.
// The program shall take a hexadecimal string and transform it into a decimal number, as if by magic.

use std::collections::HashMap;

// A function most grand, to convert a single hexadecimal character to its decimal counterpart.
fn hex_char_to_decimal(c: char) -> u32 {
    // Behold, a map of characters to their decimal values, stored in the memory of yore.
    let mut hex_map: HashMap<char, u32> = HashMap::new();
    hex_map.insert('0', 0);
    hex_map.insert('1', 1);
    hex_map.insert('2', 2);
    hex_map.insert('3', 3);
    hex_map.insert('4', 4);
    hex_map.insert('5', 5);
    hex_map.insert('6', 6);
    hex_map.insert('7', 7);
    hex_map.insert('8', 8);
    hex_map.insert('9', 9);
    hex_map.insert('A', 10);
    hex_map.insert('B', 11);
    hex_map.insert('C', 12);
    hex_map.insert('D', 13);
    hex_map.insert('E', 14);
    hex_map.insert('F', 15);

    // Return the value from the map, or zero if the character be not found.
    *hex_map.get(&c).unwrap_or(&0)
}

// A function to convert a hexadecimal string to a decimal number, with much ado.
fn hex_to_decimal(hex: &str) -> u32 {
    let mut decimal_value: u32 = 0;
    let mut power: u32 = 0;

    // Traverse the string in reverse, forsooth!
    for c in hex.chars().rev() {
        let digit_value = hex_char_to_decimal(c);
        decimal_value += digit_value * 16u32.pow(power);
        power += 1;
    }

    decimal_value
}

// The main function, where the journey begins.
fn main() {
    // A string of hexadecimal, to be converted to decimal.
    let hex_string = "1A3F";
    // Convert the string, and print the result for all to see.
    let decimal_result = hex_to_decimal(hex_string);
    println!("The decimal value of {} is {}", hex_string, decimal_result);
}

