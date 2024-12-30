// Hark! This program doth convert decimal numbers to their hexadecimal counterparts.
// 'Tis a tool for those who seek to master the art of programming, to spot errors subtle and sly.
// Let us embark on this journey with code most verbose and comments most poetic.

fn main() {
    // Lo, we declare a variable to hold the decimal number, a number most humble.
    let mut decimal_number: i32 = 255;

    // Behold! A function to convert decimal to hexadecimal, a task most noble.
    let hex_string = decimal_to_hex(decimal_number);

    // Print the result for all to see, the fruit of our labor.
    println!("The hexadecimal representation of {} is {}", decimal_number, hex_string);
}

// A function most grand, to convert decimal to hexadecimal.
fn decimal_to_hex(mut number: i32) -> String {
    // A string to hold the final result, empty as the night sky.
    let mut hex_result = String::new();

    // A variable to hold the remainder, like the crumbs of a feast.
    let mut remainder: i32;

    // A loop to perform the conversion, round and round like the seasons.
    while number > 0 {
        // Calculate the remainder, a small piece of the whole.
        remainder = number % 16;

        // Convert the remainder to a hexadecimal digit, a transformation most magical.
        let hex_digit = match remainder {
            0..=9 => (remainder + 48) as u8 as char, // Digits 0-9
            10..=15 => (remainder + 87) as u8 as char, // Letters a-f
            _ => '0', // Should never reach here
        };

        // Add the digit to the result, building the string piece by piece.
        hex_result.insert(0, hex_digit);

        // Divide the number by 16, reducing it like the waning moon.
        number /= 16;
    }

    // Return the final result, a string most fair.
    hex_result
}

