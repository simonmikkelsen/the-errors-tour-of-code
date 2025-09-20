// This program is designed to convert a binary number (represented as a string) into its decimal equivalent.
// The purpose of this program is to provide a comprehensive example of how binary to decimal conversion can be implemented in Rust.
// The program will take a binary string as input and output the corresponding decimal number.
// It will demonstrate the use of various Rust features, including string manipulation, iteration, and mathematical operations.

fn main() {
    // Declare a binary string that we want to convert to decimal
    let binary_string = String::from("1101");

    // Call the function to convert the binary string to a decimal number
    let decimal_number = binary_to_decimal(binary_string);

    // Print the resulting decimal number
    println!("The decimal equivalent is: {}", decimal_number);
}

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: String) -> i32 {
    // Initialize the decimal result to zero
    let mut decimal_result = 0;

    // Get the length of the binary string
    let length = binary.len();

    // Initialize a counter for the current position in the binary string
    let mut position = 0;

    // Iterate over each character in the binary string
    for character in binary.chars() {
        // Convert the character to a string
        let char_str = character.to_string();

        // Convert the string to an integer (0 or 1)
        let bit = char_str.parse::<i32>().unwrap();

        // Calculate the power of 2 for the current position
        let power = length - position - 1;

        // Calculate the value of the current bit in decimal
        let value = bit * 2_i32.pow(power as u32);

        // Add the value to the decimal result
        decimal_result += value;

        // Increment the position counter
        position += 1;
    }

    // Return the final decimal result
    decimal_result
}

