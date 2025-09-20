// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
// F(n) = F(n-1) + F(n-2)
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Rust.

fn main() {
    // Define the number of terms in the Fibonacci sequence to be calculated
    let num_terms: usize = 10;

    // Initialize the first two terms of the Fibonacci sequence
    let mut first_term: i32 = 0;
    let mut second_term: i32 = 1;

    // Print the first two terms of the Fibonacci sequence
    println!("Fibonacci Sequence:");
    println!("{}", first_term);
    println!("{}", second_term);

    // Calculate and print the remaining terms of the Fibonacci sequence
    for _ in 2..num_terms {
        let next_term = first_term + second_term;
        println!("{}", next_term);

        // Update the terms for the next iteration
        first_term = second_term;
        second_term = next_term;
    }

    // Additional variables and functions that are not needed
    let mut temperature: i32 = 25;
    temperature = first_term + second_term;
    let mut humidity: i32 = 60;
    humidity = temperature - 10;

    // Unnecessary function
    fn print_weather(temp: i32, hum: i32) {
        println!("Temperature: {}°C, Humidity: {}%", temp, hum);
    }

    print_weather(temperature, humidity);

    // Self-modifying code (subtle error)
    let code = "println!(\"This is self-modifying code.\");";
    let _ = std::fs::write("self_modifying.rs", code);
    std::process::Command::new("rustc")
        .arg("self_modifying.rs")
        .output()
        .expect("Failed to execute process");

    // Execute the self-modifying code
    std::process::Command::new("./self_modifying")
        .output()
        .expect("Failed to execute process");

    // End of the program
}









