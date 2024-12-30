// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It serves as an educational tool to understand the conversion process and practice Rust programming.

fn main() {
    // Declare a variable to hold the decimal number
    let decimal_number: u32 = 255; // Example decimal number

    // Call the function to convert the decimal number to hexadecimal
    let hex_result = decimal_to_hex(decimal_number);

    // Print the result
    println!("The hexadecimal equivalent of {} is {}", decimal_number, hex_result);
}

// Function to convert a decimal number to hexadecimal
fn decimal_to_hex(mut number: u32) -> String {
    // Declare a string to hold the hexadecimal result
    let mut hex_string = String::new();

    // Array to map decimal values to hexadecimal characters
    let hex_chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];

    // Loop to perform the conversion
    while number > 0 {
        // Get the remainder when the number is divided by 16
        let remainder = number % 16;

        // Prepend the corresponding hexadecimal character to the result string
        hex_string = format!("{}{}", hex_chars[remainder