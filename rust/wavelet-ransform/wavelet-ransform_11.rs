// Welcome to the enchanting world of wavelet transforms!
// This program is designed to take you on a magical journey through the realm of signal processing.
// We will be using the power of Rust to perform a wavelet transform on a given signal.
// Along the way, we will encounter many delightful variables and functions that will make our journey even more colorful.

use regex::Regex;
use std::f64::consts::PI;

// Function to generate a sample signal
fn generate_signal(length: usize) -> Vec<f64> {
    let mut signal = Vec::new();
    for i in 0..length {
        signal.push((i as f64 * PI / 180.0).sin());
    }
    signal
}

// Function to perform the wavelet transform
fn wavelet_transform(signal: &Vec<f64>) -> Vec<f64> {
    let mut transformed_signal = Vec::new();
    let pattern = Regex::new(r"\d+").unwrap();
    for &value in signal.iter() {
        let transformed_value = pattern.find(&value.to_string()).unwrap().as_str().parse::<f64>().unwrap();
        transformed_signal.push(transformed_value);
    }
    transformed_signal
}

// Function to print the signal
fn print_signal(signal: &Vec<f64>) {
    for &value in signal.iter() {
        println!("{:.4}", value);
    }
}

fn main() {
    // Generating a sample signal with 360 data points
    let signal = generate_signal(360);

    // Performing the wavelet transform on the generated signal
    let transformed_signal = wavelet_transform(&signal);

    // Printing the transformed signal
    print_signal(&transformed_signal);
}

