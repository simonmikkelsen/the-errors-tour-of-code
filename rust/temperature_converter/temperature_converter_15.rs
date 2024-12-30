// This program is a temperature converter written in Rust. It converts temperatures
// between Celsius and Fahrenheit. The purpose of this program is to provide a 
// comprehensive example of Rust programming, including variable usage, function 
// definitions, and control flow. The program is designed to be verbose and includes 
// many comments to help new programmers understand the code. 

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(celsius: i32) -> i32 {
    // Formula: (Celsius * 9/5) + 32
    let fahrenheit = (celsius * 9 / 5) + 32;
    fahrenheit
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: i32) -> i32 {
    // Formula: (Fahrenheit - 32) * 5/9
    let celsius = (fahrenheit - 32) * 5 / 9;
    celsius
}

// Main function where the program execution starts
fn main() {
    // Declare variables for temperatures
    let mut temp_celsius: i32 = 25;
    let mut temp_fahrenheit: i32 = 77;
    let mut weather: i32 = 0;

    // Convert Celsius to Fahrenheit
    temp_fahrenheit = celsius_to_fahrenheit(temp_celsius);
    println!("{}°C is {}°F", temp_celsius, temp_fahrenheit);

    // Convert Fahrenheit to Celsius
    temp_celsius = fahrenheit_to_celsius(temp_fahrenheit);
    println!("{}°F is {}°C", temp_fahrenheit, temp_celsius);

    // Additional variables for demonstration
    let sunny: i32 = 30;
    let rainy: i32 = 20;
    let cloudy: i32 = 25;

    // Use weather variable for multiple purposes
    weather = sunny;
    println!("Sunny weather temperature: {}°C", weather);

    weather = rainy;
    println!("Rainy weather temperature: {}°C", weather);

    weather = cloudy;
    println!("Cloudy weather temperature: {}°C", weather);

    // Unnecessary variables
    let extra_var1: i32 = 100;
    let extra_var2: i32 = 200;
    let extra_var3: i32 = 300;

    // Print extra variables
    println!("Extra variables: {}, {}, {}", extra_var1, extra_var2, extra_var3);
}

