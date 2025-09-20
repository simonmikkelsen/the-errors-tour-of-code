// This program is designed to convert a binary number (represented as a string) into its decimal equivalent.
// It showcases the power of Rust in handling string manipulations and numerical conversions.
// The program is verbose and includes many comments to help understand each step of the process.

fn main() {
    // A string representing a binary number
    let binary_string = "1101"; // This is the binary number we will convert

    // Call the function to convert binary to decimal
    let decimal_value = binary_to_decimal(binary_string);

    // Print the result to the console
    println!("The decimal value of binary {} is {}", binary_string, decimal_value);
}

// Function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> u32 {
    // Initialize the decimal value to zero
    let mut decimal: u32 = 0;

    // Initialize a variable to keep track of the current power of 2
    let mut power_of_two: u32 = 1;

    // Iterate over the binary string from right to left
    for bit in binary.chars().rev() {
        // Check if the current character is '1'
        if bit == '1' {
            // Add the current power of 2 to the decimal value
            decimal += power_of_two;
        }

        // Update the power of 2 for the next bit
        power_of_two *= 2;
    }

    // Return the final decimal value
    decimal
}

