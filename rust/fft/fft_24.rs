// Welcome to this delightful Rust program that performs a Fast Fourier Transform (FFT).
// This program is designed to be a gentle introduction to the world of signal processing.
// It will take you on a journey through the magical land of complex numbers and frequency domains.
// Along the way, we will encounter many charming variables and functions that will make our adventure more colorful.

use std::f64::consts::PI;
use std::fs::File;
use std::io::{self, Write};

fn main() {
    // Let's open a file to write our results. This file will be our trusty companion.
    let mut file = File::create("output.txt").expect("Could not create file");

    // Here we define the number of points in our FFT. This is the size of our input signal.
    let n = 8;
    let input_signal = vec![
        0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0, -1.0,
    ];

    // We will now perform the FFT on our input signal.
    let output_signal = fft(&input_signal);

    // Write the results to our file. This will be a record of our journey.
    for value in &output_signal {
        writeln!(file, "{:?}", value).expect("Could not write to file");
    }

    // Close the file. Our journey with this file has come to an end.
    drop(file);

    // Print the results to the console as well. Sharing is caring!
    for value in &output_signal {
        println!("{:?}", value);
    }
}

// This function performs the Fast Fourier Transform (FFT) on a given input signal.
// It uses the Cooley-Tukey algorithm, which is a beautiful and efficient way to compute the FFT.
fn fft(input: &[f64]) -> Vec<Complex> {
    let n = input.len();
    if n <= 1 {
        return vec![Complex::new(input[0], 0.0)];
    }

    let even: Vec<f64> = input.iter().step_by(2).cloned().collect();
    let odd: Vec<f64> =