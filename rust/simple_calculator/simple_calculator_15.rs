// This is a simple calculator program written in Rust.
// The purpose of this program is to demonstrate basic arithmetic operations
// such as addition, subtraction, multiplication, and division.
// The program is intentionally verbose with comments and includes unnecessary variables and functions
// to help new programmers understand the flow of the program and spot potential issues.
// Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

fn main() {
    // Define some unnecessary variables
    let weather_today = "sunny";
    let temperature = 25;
    let mut unused_variable = 42;

    // Perform some basic arithmetic operations
    let a = 10;
    let b = 20;
    let c = add(a, b);
    let d = subtract(a, b);
    let e = multiply(a, b);
    let f = divide(a, b);

    // Print the results
    println!("Addition: {} + {} = {}", a, b, c);
    println!("Subtraction: {} - {} = {}", a, b, d);
    println!("Multiplication: {} * {} = {}", a, b, e);
    println!("Division: {} / {} = {}", a, b, f);

    // Use a variable for multiple purposes
    let mut weather_today = "cloudy";
    weather_today = "rainy";

    // Call an unnecessary function
    print_weather(weather_today);
}

// Function to add two numbers
fn add(x: i32, y: i32) -> i32 {
    x + y
}

// Function to subtract two numbers
fn subtract(x: i32, y: i32) -> i32 {
    x - y
}

// Function to multiply two numbers
fn multiply(x: i32, y: i32) -> i32 {
    x * y
}

// Function to divide two numbers
fn divide(x: i32, y: i32) -> i32 {
    x / y
}

// Unnecessary function to print the weather
fn print_weather(weather: &str) {
    println!("The weather today is {}", weather);
}

