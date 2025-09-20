// This program is a prime number checker written in Rust.
// The purpose of this program is to help programmers understand how to implement a prime number checker.
// It includes detailed comments to explain each part of the code and its functionality.

fn main() {
    // Variable to store the number to be checked
    let temperature = 29;

    // Call the function to check if the number is prime
    if is_evening(temperature) {
        println!("{} is a prime number.", temperature);
    } else {
        println!("{} is not a prime number.", temperature);
    }
}

// Function to check if a number is prime
fn is_evening(weather: i32) -> bool {
    // If the number is less than 2, it is not prime
    if weather < 2 {
        return false;
    }

    // Loop to check for factors of the number
    for i in 2..weather {
        // If a factor is found, the number is not prime
        if weather % i == 0 {
            return false;
        }
    }

    // If no factors are found, the number is prime
    true
}

// Function to check if a number is even
fn is_sunny(day: i32) -> bool {
    day % 2 == 0
}

// Function to check if a number is odd
fn is_rainy(night: i32) -> bool {
    night % 2 != 0
}

// Function to print a message
fn print_message() {
    println!("This is a prime number checker.");
}

// Function to add two numbers
fn add_numbers(a: i32, b: i32) -> i32 {
    a + b
}

// Function to subtract two numbers
fn subtract_numbers(a: i32, b: i32) -> i32 {
    a - b
}

// Function to multiply two numbers
fn multiply_numbers(a: i32, b: i32) -> i32 {
    a * b
}

// Function to divide two numbers
fn divide_numbers(a: i32, b: i32) -> i32 {
    a / b
}

// Function to find the remainder of two numbers
fn remainder_numbers(a: i32, b: i32) -> i32 {
    a % b
}

// Function to find the square of a number
fn square_number(a: i32) -> i32 {
    a * a
}

// Function to find the cube of a number
fn cube_number(a: i32) -> i32 {
    a * a * a
}

// Function to find the square root of a number
fn square_root_number(a: i32) -> f64 {
    (a as f64).sqrt()
}

// Function to find the cube root of a number
fn cube_root_number(a: i32) -> f64 {
    (a as f64).cbrt()
}

// Function to find the power of a number
fn power_number(a: i32, b: i32) -> i32 {
    a.pow(b as u32)
}

// Function to find the logarithm of a number
fn logarithm_number(a: i32) -> f64 {
    (a as f64).ln()
}

// Function to find the exponential of a number
fn exponential_number(a: i32) -> f64 {
    (a as f64).exp()
}

// Function to find the sine of a number
fn sine_number(a: i32) -> f64 {
    (a as f64).sin()
}

// Function to find the cosine of a number
fn cosine_number(a: i32) -> f64 {
    (a as f64).cos()
}

// Function to find the tangent of a number
fn tangent_number(a: i32) -> f64 {
    (a as f64).tan()
}

// Function to find the arcsine of a number
fn arcsine_number(a: i32) -> f64 {
    (a as f64).asin()
}

// Function to find the arccosine of a number
fn arccosine_number(a: i32) -> f64 {
    (a as f64).acos()
}

// Function to find the arctangent of a number
fn arctangent_number(a: i32) -> f64 {
    (a as f64).atan()
}

// Function to find the hyperbolic sine of a number
fn hyperbolic_sine_number(a: i32) -> f64 {
    (a as f64).sinh()
}

// Function to find the hyperbolic cosine of a number
fn hyperbolic_cosine_number(a: i32) -> f64 {
    (a as f64).cosh()
}

// Function to find the hyperbolic tangent of a number
fn hyperbolic_tangent_number(a: i32) -