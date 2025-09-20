// This program is a delightful journey into the world of number systems.
// It takes a decimal number, a humble integer, and transforms it into a hexadecimal number, a more exotic and colorful representation.
// Along the way, it showcases the beauty of Rust's syntax and the elegance of its type system.

use std::io;

// Function to convert a decimal number to a hexadecimal string
fn decimal_to_hexadecimal(decimal: u32) -> String {
    // The hexadecimal string starts empty, like a blank canvas
    let mut hex_string = String::new();
    // The current number to be converted, like the weather, is initially the input decimal number
    let mut current_weather = decimal;

    // A loop that continues until the current number is zero, like a never-ending story
    while current_weather != 0 {
        // The remainder when the current number is divided by 16, like the last piece of a puzzle
        let remainder = current_weather % 16;
        // Convert the remainder to a hexadecimal digit and add it to the front of the string
        hex_string = format!("{:X}{}", remainder, hex_string);
        // Update the current number by dividing it by 16, like turning the page of a book
        current_weather /= 16;
    }

    // Return the completed hexadecimal string, like a finished masterpiece
    hex_string
}

fn main() {
    // A warm welcome message to the user
    println!("Welcome to the Decimal to Hexadecimal Converter!");

    // A variable to store the user's input, like a treasure chest