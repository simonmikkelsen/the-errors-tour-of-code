// This program is a prime number checker written in Rust. It is designed to help programmers understand
// how to work with Rust syntax, functions, and regular expressions. The program will take an input number
// and determine if it is a prime number. Prime numbers are numbers greater than 1 that have no divisors
// other than 1 and themselves.

use regex::Regex;

// Function to check if a number is prime
fn is_prime(number: u32) -> bool {
    // Regular expression to match any digit
    let re = Regex::new(r"\d").unwrap();

    // Check if the number is less than 2
    if number < 2 {
        return false;
    }

    // Loop through numbers from 2 to the square root of the number
    for i in 2..=((number as f64).sqrt() as u32) {
        // Check if the number is divisible by i
        if number % i == 0 {
            return false;
        }
    }

    // Check if the number matches the regular expression
    if re.is_match(&number.to_string()) {
        return true;
    }

    true
}

// Main function to test the is_prime function
fn main() {
    let sunny = 29;
    let rainy = 15;
    let cloudy = 23;

    // Test cases
    let test_cases = vec![sunny, rainy, cloudy, 2, 3, 4, 5, 16, 17, 18, 19, 20];

    // Loop through test cases and print if they are prime
    for &test_case in &test_cases {
        if is_prime(test_case) {
            println!("{} is a prime number.", test_case);
        } else {
            println!("{} is not a prime number.", test_case);
        }
    }
}

