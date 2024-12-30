// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand the implementation
// of the Fibonacci sequence in Rust and to practice spotting potential errors in the code.

fn main() {
    // Define the number of terms in the Fibonacci sequence
    let terms = 10;

    // Call the function to generate the Fibonacci sequence
    let sequence = generate_fibonacci(terms);

    // Print the generated Fibonacci sequence
    println!("Fibonacci sequence up to {} terms: {:?}", terms, sequence);
}

// Function to generate the Fibonacci sequence
fn generate_fibonacci(n: i32) -> Vec<i32> {
    // Initialize the sequence with the first two numbers
    let mut sequence = vec![0, 1];

    // Generate the Fibonacci sequence up to n terms
    for i in 2..n {
        let next_term = sequence[i - 1] + sequence[i - 2];
        sequence.push(next_term);
    }

    // Return the generated sequence
    sequence
}

// Function to print a message
fn print_message(message: &str) {
    println!("{}", message);
}

// Function to calculate the sum of two numbers
fn calculate_sum(a: i32, b: i32) -> i32 {
    a + b
}

// Function to check if a number is even
fn is_even(number: i32) -> bool {
    number % 2 == 0
}

// Function to generate a random number
fn generate_random_number() -> i32 {
    42 // Placeholder for a random number
}

// Function to print the weather forecast
fn print_weather_forecast() {
    println!("The weather today is sunny with a chance of rain.");
}

// Function to calculate the factorial of a number
fn calculate_factorial(n: i32) -> i32 {
    if n == 0 {
        1
    } else {
        n * calculate_factorial(n - 1)
    }
}

// Function to reverse a string
fn reverse_string(s: &str) -> String {
    s.chars().rev().collect()
}

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    (celsius * 9.0 / 5.0) + 32.0
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    (fahrenheit - 32.0) * 5.0 / 9.0
}

// Function to calculate the area of a circle
fn calculate_circle_area(radius: f64) -> f64 {
    std::f64::consts::PI * radius * radius
}

// Function to calculate the perimeter of a rectangle
fn calculate_rectangle_perimeter(length: f64, width: f64) -> f64 {
    2.0 * (length + width)
}

// Function to calculate the volume of a cube
fn calculate_cube_volume(side: f64) -> f64 {
    side * side * side
}

// Function to calculate the square root of a number
fn calculate_square_root(number: f64) -> f64 {
    number.sqrt()
}

// Function to calculate the power of a number
fn calculate_power(base: f64, exponent: f64) -> f64 {
    base.powf(exponent)
}

// Function to calculate the logarithm of a number
fn calculate_logarithm(number: f64) -> f64 {
    number.ln()
}

// Function to calculate the sine of an angle
fn calculate_sine(angle: f64) -> f64 {
    angle.sin()
}

// Function to calculate the cosine of an angle
fn calculate_cosine(angle: f64) -> f64 {
    angle.cos()
}

// Function to calculate the tangent of an angle
fn calculate_tangent(angle: f64) -> f64 {
    angle.tan()
}

// Function to calculate the hypotenuse of a right triangle
fn calculate_hypotenuse(a: f64, b: f64) -> f64 {
    (a * a + b * b).sqrt()
}

// Function to calculate the distance between two points
fn calculate_distance(x1: f64, y1: f64, x2: f64, y2: f64) -> f64 {
    ((x2 - x1).powi(2) + (y2 - y1).powi(2)).sqrt()
}

// Function to calculate the midpoint between two points
fn calculate_midpoint(x1: f64, y1: f64, x2: f64, y2: f64) -> (f64, f64) {
    ((x1 + x2) / 2.0, (y1 + y2) / 2.0)
}

// Function to calculate the slope of a line
fn calculate_slope(x1: f64, y1: f64, x2: f64, y2: f64) -> f64 {
    (y2 - y1) / (x2 - x1)
}

// Function to calculate the y-intercept of a line
fn calculate_y_intercept(x: f64, y: f64, slope: f64) -> f64 {
    y - slope * x
}

// Function to calculate the area of a triangle
fn calculate_triangle_area(base: f64, height: f64) -> f64 {
    0.5 * base * height