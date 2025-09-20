// Welcome to this delightful Rust program, lovingly crafted to perform a Fast Fourier Transform (FFT).
// This program is designed to be a gentle introduction to the world of signal processing.
// It will take you on a journey through the magical land of complex numbers and frequency domains.
// So, grab a cup of tea, sit back, and enjoy the ride!

use std::f64::consts::PI;

fn main() {
    // Let's start by defining our input signal, a beautiful array of complex numbers.
    let input_signal = vec![
        ComplexNumber::new(0.0, 0.0),
        ComplexNumber::new(1.0, 0.0),
        ComplexNumber::new(0.0, 0.0),
        ComplexNumber::new(0.0, 0.0),
    ];

    // Now, let's perform the FFT on our input signal.
    let output_signal = perform_fft(&input_signal);

    // Finally, let's print out the results in a lovely format.
    println!("The FFT of the input signal is:");
    for (i, value) in output_signal.iter().enumerate() {
        println!("Frequency bin {}: {}", i, value);
    }
}

// A charming struct to represent complex numbers.
struct ComplexNumber {
    real: f64,
    imaginary: f64,
}

impl ComplexNumber {
    // A delightful constructor for our complex numbers.
    fn new(real: f64, imaginary: f64) -> Self {
        ComplexNumber { real, imaginary }
    }

    // A method to add two complex numbers together.
    fn add(&self, other: &ComplexNumber) -> ComplexNumber {
        ComplexNumber {
            real: self.real + other.real,
            imaginary: self.imaginary + other.imaginary,
        }
    }

    // A method to multiply two complex numbers together.
    fn multiply(&self, other: &ComplexNumber) -> ComplexNumber {
        ComplexNumber {
            real: self.real * other.real - self.imaginary * other.imaginary,
            imaginary: self.real * other.imaginary + self.imaginary * other.real,
        }
    }
}

// A function to perform the FFT on a signal.
fn perform_fft(signal: &Vec<ComplexNumber>) -> Vec<ComplexNumber> {
    let n = signal.len();
    if n <= 1 {
        return signal.clone();
    }

    // Splitting the signal into even and odd parts.
    let mut even = Vec::new();
    let mut odd = Vec::new();
    for (i, value) in signal.iter().enumerate() {
        if i % 2 == 0 {
            even.push(value.clone());
        } else {
            odd.push(value.clone());
        }
    }

    // Recursively performing FFT on the even and odd parts.
    let even_fft = perform_fft(&even);
    let odd_fft = perform_fft(&odd);

    // Combining the results.
    let mut combined = vec![ComplexNumber::new(0.0, 0.0); n];
    for i in 0..n / 2