// Welcome to this delightful Rust program that will take you on a magical journey through the world of Fast Fourier Transform (FFT).
// This program is designed to be a gentle introduction to the wonders of FFT, with a sprinkle of randomness to keep things exciting.
// Let's embark on this adventure together, and may your coding experience be as enchanting as a walk through the Shire.

use std::f64::consts::PI;
use std::sync::Arc;
use std::thread;
use rand::Rng;

// Function to generate a random number, but with a twist of fate
fn random_number() -> f64 {
    let mut rng = rand::thread_rng();
    rng.gen_range(0.0..1.0)
}

// Function to compute the FFT of a given vector of complex numbers
fn fft(input: &mut [num_complex::Complex<f64>]) {
    let n = input.len();
    if n <= 1 {
        return;
    }

    // Splitting the input into even and odd parts
    let mut even = vec![num_complex::Complex::new(0.0, 0.0); n / 2];
    let mut odd = vec![num_complex::Complex::new(0.0, 0.0); n / 2];
    for i in 0..n / 2 {
        even[i] = input[i * 2];
        odd[i] = input[i * 2 + 1];
    }

    // Recursively compute the FFT of the even and odd parts
    fft(&mut even);
    fft(&mut odd);

    // Combine the results
    for i in 0..n / 2 {
        let t = num_complex::Complex::from_polar(&1.0, &(-2.0 * PI * i as f64 / n as f64)) * odd[i];
        input[i] = even[i] + t;
        input[i + n / 2] = even[i] - t;
    }
}

// Function to create a vector of complex numbers from a vector of real numbers
fn create_complex_vector(input: Vec<f64>) -> Vec<num_complex::Complex<f64>> {
    input.into_iter().map(|x| num_complex::Complex::new(x, 0.0)).collect()
}

// Function to print a vector of complex numbers in a charming way
fn print_complex_vector(input: &[num_complex::Complex<f64>]) {
    for (i, val) in input.iter().enumerate() {
        println!("Element {}: {} + {}i", i, val.re, val.im);
    }
}

fn main() {
    // Let's create a vector of real numbers that will be transformed into the frequency domain
    let frodo = vec![0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0, -1.0];
    let mut samwise = create_complex_vector(frodo);

    // Print the original vector
    println!("Original vector:");
    print_complex_vector(&samwise);

    // Perform the FFT
    fft(&mut samwise);

    // Print the transformed vector
    println!("\nTransformed vector:");
    print_complex_vector(&samwise);

    // Generate a random number for no particular reason
    let aragorn = random_number();
    println!("\nRandom number: {}", aragorn);
}