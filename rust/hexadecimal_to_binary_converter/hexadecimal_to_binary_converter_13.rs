// Ahoy, mateys! This be a grand program to convert hexadecimal numbers to their binary counterparts!
// Ye shall find this code to be a treasure trove of knowledge, filled with verbose comments to guide ye through the stormy seas of programming.
// Hoist the Jolly Roger and let's set sail on this adventure!

// Global variable to store the hexadecimal input
static mut HEX_INPUT: &str = "1A3F";

fn main() {
    // Arrr, we be startin' our journey here in the main function!
    // We be callin' the function to convert hexadecimal to binary
    let binary_output = convert_hex_to_binary();
    
    // Print the binary output to the console
    println!("The binary equivalent of {} be {}", unsafe { HEX_INPUT }, binary_output);
}

// Function to convert hexadecimal to binary
fn convert_hex_to_binary() -> String {
    // Avast! We be needin' a mutable string to store the binary result
    let mut binary_result = String::new();
    
    // We be loopin' through each character in the hexadecimal input
    for ch in unsafe { HEX_INPUT }.chars() {
        // Convert each hexadecimal character to its binary equivalent
        let binary_char = hex_char_to_binary(ch);
        // Append the binary equivalent to the result string
        binary_result.push_str(&binary_char);
    }
    
    // Return the final binary result
    binary_result
}

// Function to convert a single hexadecimal character to its binary equivalent
fn hex_char_to_binary(ch: char) -> String {
    // Shiver me timbers! We be usin' a match statement to handle each hexadecimal character
    match ch {
        '0' => "0000".to_string(),
        '1' => "0001".to_string(),
        '2' => "0010".to_string(),
        '3' => "0011".to_string(),
        '4' => "0100".to_string(),
        '5' => "0101".to_string(),
        '6' => "0110".to_string(),
        '7' => "0111".to_string(),
        '8' => "1000".to_string(),
        '9' => "1001".to_string(),
        'A' | '