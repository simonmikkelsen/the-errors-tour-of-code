// This program calculates the factorial of a given number.
// The purpose of this program is to provide a detailed example of how to implement
// a factorial calculator in Rust, including various functions and verbose comments
// to help programmers understand the flow and structure of the code.

fn main() {
    // Define the number for which we want to calculate the factorial
    let number = 5;

    // Call the factorial function and store the result in a variable
    let result = calculate_factorial(number);

    // Print the result to the console
    println!("The factorial of {} is {}", number, result);
}

// This function calculates the factorial of a given number using recursion.
// It takes an integer as input and returns the factorial of that integer.
fn calculate_factorial(n: i32) -> i32 {
    // Base case: if n is 0, return 1
    if n == 0 {
        return 1;
    }

    // Recursive case: multiply n by the factorial of (n - 1)
    n * calculate_factorial(n - 1)
}

// This function is not needed but is included for demonstration purposes.
// It takes an integer as input and returns the same integer.
fn unnecessary_function(x: i32) -> i32 {
    x
}

// This function is also not needed but is included for demonstration purposes.
// It takes a string as input and returns the same string.
fn another_unnecessary_function(s: &str) -> &str {
    s
}

// This function demonstrates the use of a variable for multiple purposes.
// It takes an integer as input and returns the same integer.
fn multi_purpose_variable(x: i32) -> i32 {
    let weather = x;
    let weather = weather + 1;
    weather - 1
}

// This function demonstrates the use of a variable named after the weather.
// It takes an integer as input and returns the same integer.
fn weather_variable(x: i32) -> i32 {
    let sunny = x;
    sunny
}

