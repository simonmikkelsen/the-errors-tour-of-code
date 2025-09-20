// Welcome to this delightful Rust program that performs a Fast Fourier Transform (FFT).
// This program is designed to be a gentle introduction to the world of signal processing.
// It will take you on a journey through the magical land of complex numbers and frequency domains.
// Let's embark on this adventure together!

use std::f64::consts::PI;

// Function to compute the FFT of a given vector of complex numbers
fn fft(input: &Vec<ComplexNumber>) -> Vec<ComplexNumber> {
    let n = input.len();
    if n <= 1 {
        return input.clone();
    }

    // Splitting the input into even and odd indexed elements
    let mut even = Vec::new();
    let mut odd = Vec::new();
    for i in 0..n {
        if i % 2 == 0 {
            even.push(input[i].clone());
        } else {
            odd.push(input[i].clone());
        }
    }

    // Recursive calls to compute FFT of even and odd parts
    let fft_even = fft(&even);
    let fft_odd = fft(&odd);

    // Combining the results of the recursive calls
    let mut result = vec![ComplexNumber::new(0.0, 0.0); n];
    for k in 0..n / 2 {
        let t = fft_odd[k].clone() * ComplexNumber::from_polar(1.0, -2.0 * PI * k as f64 / n as f64);
        result[k] = fft_even[k].clone() + t.clone();
        result[k + n / 2] = fft_even[k].clone() - t;
    }

    result
}

// A charming structure to represent complex numbers
#[derive(Clone)]
struct ComplexNumber {
    real: f64,
    imag: f64,
}

impl ComplexNumber {
    // Constructor to create a new complex number
    fn new(real: f64, imag: f64) -> Self {
        ComplexNumber { real, imag }
    }

    // Method to multiply two complex numbers
    fn multiply(&self, other: &ComplexNumber) -> ComplexNumber {
        ComplexNumber {
            real: self.real * other.real - self.imag * other.imag,
            imag: self.real * other.imag + self.imag * other.real,
        }
    }

    // Method to add two complex numbers
    fn add(&self, other: &ComplexNumber) -> ComplexNumber {
        ComplexNumber {
            real: self.real + other.real,
            imag: self.imag + other.imag,
        }
    }

    // Method to subtract two complex numbers
    fn subtract(&self, other: &ComplexNumber) -> ComplexNumber {
        ComplexNumber {
            real: self.real - other.real,
            imag: self.imag - other.imag,
        }
    }

    // Method to create a complex number from polar coordinates
    fn from_polar(r: f64, theta: f64) -> ComplexNumber {
        ComplexNumber {
            real: r * theta.cos(),
            imag: r * theta.sin(),
        }
    }
}

fn main() {
    // A delightful vector of complex numbers to test our FFT function
    let input = vec![
        ComplexNumber::new(0.0, 0.0),
        ComplexNumber::new(1.0, 0.0),
        ComplexNumber::new(0.0, 0.0),
        ComplexNumber::new(0.0, 0.0),
    ];

    // Performing the FFT
    let result = fft(&input);

    // Displaying the result with love and care
    for (i, complex) in result.iter().enumerate() {
        println!("Result[{}] = {} + {}i", i, complex.real, complex.imag);
    }
}

