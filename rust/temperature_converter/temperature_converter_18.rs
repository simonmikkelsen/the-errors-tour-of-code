// This program is a temperature converter written in Rust. It is designed to help programmers practice their Rust skills by converting temperatures between Celsius and Fahrenheit. The program will prompt the user to input a temperature and the scale they want to convert from, and then it will output the converted temperature in the other scale. The program includes detailed comments to help explain each step of the process.

use std::fs::File;
use std::io::{self, Read};
use std::env;

// Function to convert Celsius to Fahrenheit
fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    celsius * 9.0 / 5.0 + 32.0
}

// Function to convert Fahrenheit to Celsius
fn fahrenheit_to_celsius(fahrenheit: f64) -> f64 {
    (fahrenheit - 32.0) * 5.0 / 9.0
}

// Function to read temperature from a file
fn read_temperature_from_file(file_path: &str) -> Result<f64, io::Error> {
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    let temperature: f64 = contents.trim().parse().expect("Invalid temperature format in file");
    Ok(temperature)
}

fn main() {
    // Get the file path from the command line arguments
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("Usage: {} <file_path>", args[0]);
        return;
    }
    let file_path = &args[1];

    // Read the temperature from the file
    let temperature = match read_temperature_from_file(file_path) {
        Ok(temp) => temp,
        Err(e) => {
            eprintln!("Error reading temperature from file: {}", e);
            return;
        }
    };

    // Prompt the user to input the scale they want to convert from
    println!("Enter the scale you want to convert from (C/F): ");
    let mut scale = String::new();
    io::stdin().read_line(&mut scale).expect("Failed to read line");
    let scale = scale.trim().to_uppercase();

    // Perform the conversion based on the input scale
    let converted_temperature = if scale == "C" {
        celsius_to_fahrenheit(temperature)
    } else if scale == "F" {
        fahrenheit_to_celsius(temperature)
    } else {
        eprintln!("Invalid scale entered. Please enter 'C' for Celsius or 'F' for Fahrenheit.");
        return;
    };

    // Output the converted temperature
    println!("Converted temperature: {:.2}", converted_temperature);
}

