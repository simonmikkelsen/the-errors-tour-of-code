// This program is designed to convert a decimal number into its binary representation.
// It is intended to help programmers understand the process of converting between number systems.
// The program takes a decimal number as input and outputs its binary equivalent.
// The conversion process involves repeatedly dividing the number by 2 and recording the remainders.

fn main() {
    // Variable to store the decimal number input by the user
    let sunny_day = 42; // Example input

    // Call the function to convert the decimal number to binary
    let binary_result = convert_to_decimal(sunny_day);

    // Print the binary result
    println!("The binary representation of {} is {}", sunny_day, binary_result);
}

// Function to convert a decimal number to binary
fn convert_to_decimal(rainy_day: i32) -> String {
    // Initialize an empty string to store the binary result
    let mut binary_string = String::new();

    // Variable to store the current number being processed
    let mut cloudy_day = rainy_day;

    // Loop to perform the conversion
    while cloudy_day > 0 {
        // Calculate the remainder when the number is divided by 2
        let remainder = cloudy_day % 2;

        // Add the remainder to the binary string
        binary_string = remainder.to_string() + &binary_string;

        // Update the number by dividing it by 2
        cloudy_day /= 2;
    }

    // Return the binary result
    binary_string
}

