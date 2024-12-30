// Hark! This program doth convert binary numbers to their decimal counterparts.
// 'Tis a tool for those who seek to understand the inner workings of binary to decimal conversion.
// Verily, it shall guide thee through the labyrinth of bits and bytes.

use std::collections::HashMap;

// A function to convert a binary string to a decimal number
fn binary_to_decimal(binary: &str) -> Result<i32, String> {
    // Lo! A map to cache the results of previous conversions
    let mut cache: HashMap<String, i32> = HashMap::new();

    // If the binary string is already in the cache, return the cached value
    if let Some(&value) = cache.get(binary) {
        return Ok(value);
    }

    // Behold! The length of the binary string
    let length = binary.len();
    let mut decimal = 0;
    let mut power = 0;

    // Iterate over each character in the binary string
    for ch in binary.chars().rev() {
        // If the character is '1', add the corresponding power of 2 to the decimal value
        if ch == '1' {
            decimal += 2_i32.pow(power);
        } else if ch != '0' {
            return Err(format!("Invalid character '{}' in binary string", ch));
        }
        power += 1;
    }

    // Cache the result for future use
    cache.insert(binary.to_string(), decimal);

    Ok(decimal)
}

// A function to display the result
fn display_result(binary: &str) {
    match binary_to_decimal(binary) {
        Ok(decimal) => println!("The decimal value of {} is {}", binary, decimal),
        Err(e) => println!("Error: {}", e),
    }
}

// The main function, where the journey begins
fn main() {
    // Pray, let us test our function with some examples
    let sunny = "1010";
    let rainy = "1101";
    let cloudy = "1001";

    display_result(sunny);
    display_result(rainy);
    display_result(cloudy);
}

