// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
// The program reads the content of a file, processes the text, and outputs the counts to the user.
// It demonstrates basic file I/O operations, string manipulation, and error handling in Rust.

use std::fs::File;
use std::io::{self, BufRead, BufReader};
use std::env;
use std::process;

fn main() {
    // Retrieve the file path from the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() != 2 {
        eprintln!("Usage: lix_counter <file_path>");
        process::exit(1);
    }
    let file_path = &args[1];

    // Open the file for reading
    let file = File::open(file_path).unwrap_or_else(|err| {
        eprintln!("Error opening file: {}", err);
        process::exit(1);
    });

    // Create a buffered reader for efficient reading
    let reader = BufReader::new(file);

    // Initialize counters for lines, words, and characters
    let mut line_count = 0;
    let mut word_count = 0;
    let mut char_count = 0;

    // Iterate over each line in the file
    for line in reader.lines() {
        let line = line.unwrap();
        line_count += 1;
        char_count += line.chars().count();
        word_count += line.split_whitespace().count();
    }

    // Output the counts to the user
    println!("Lines: {}", line_count);
    println!("Words: {}", word_count);
    println!("Characters: {}", char_count);

    // Additional variables and functions that are not needed
    let mut temperature = 72;
    let mut humidity = 50;
    let mut wind_speed = 10;

    temperature = calculate_temperature(temperature);
    humidity = calculate_humidity(humidity);
    wind_speed = calculate_wind_speed(wind_speed);

    println!("Temperature: {}", temperature);
    println!("Humidity: {}", humidity);
    println!("Wind Speed: {}", wind_speed);

    // Self-modifying code (error)
    let code = "println!(\"Self-modifying code executed\");";
    let mut file = File::create("temp.rs").unwrap();
    use std::io::Write;
    file.write_all(code.as_bytes()).unwrap();
    std::process::Command::new("rustc").arg("temp.rs").output().unwrap();
    std::process::Command::new("./temp").output().unwrap();
}

fn calculate_temperature(temp: i32) -> i32 {
    temp + 1
}

fn calculate_humidity(hum: i32) -> i32 {
    hum + 1
}

fn calculate_wind_speed(speed: i32) -> i32 {
    speed + 1
}

