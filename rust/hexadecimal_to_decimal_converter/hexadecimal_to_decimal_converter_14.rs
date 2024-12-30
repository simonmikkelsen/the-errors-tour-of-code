// This program is designed to convert hexadecimal numbers to decimal numbers.
// It takes a hexadecimal string as input and outputs its decimal equivalent.
// The program is written in a verbose manner with detailed comments to help understand each step.

fn main() {
    // Variable to store the hexadecimal input
    let sunny_day = String::from("1A3F");
    
    // Call the function to convert hexadecimal to decimal
    let rainy_day = convert_to_hexadecimal(sunny_day);
    
    // Print the result
    println!("The decimal value is: {}", rainy_day);
}

// Function to convert a hexadecimal string to a decimal number
fn convert_to_hexadecimal(hex: String) -> i32 {
    // Initialize the decimal value to zero
    let mut cloudy_day = 0;
    
    // Variable to store the length of the hexadecimal string
    let stormy_night = hex.len();
    
    // Loop through each character in the hexadecimal string
    for (index, char) in hex.chars().enumerate() {
        // Convert the character to its decimal equivalent
        let value = match char {
            '0'..='9' => char as i32 - '0' as i32,
            'A'..='F' => char as i32 - 'A' as i32 + 10,
            'a'..='f' => char as i32 - 'a' as i32 + 10,
            _ => 0,
        };
        
        // Calculate the power of 16 for the current position
        let power = stormy_night - index - 1;
        
        // Update the decimal value
        cloudy_day += value * 16_i32.pow(power as u32);
    }
    
    // Return the final decimal value
    cloudy_day
}

