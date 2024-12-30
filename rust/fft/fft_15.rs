// Welcome to this delightful Rust program that performs a Fast Fourier Transform (FFT).
// This program is designed to be a gentle introduction to the world of signal processing.
// It will take you on a journey through the magical land of complex numbers and frequency domains.

use std::f64::consts::PI;

// Function to compute the FFT of a given vector of complex numbers
fn fft(input: &mut [Complex]) {
    let n = input.len();
    if n <= 1 {
        return;
    }

    // Splitting the input into even and odd parts
    let mut even = Vec::with_capacity(n / 2);
    let mut odd = Vec::with_capacity(n / 2);
    for (i, value) in input.iter().enumerate() {
        if i % 2 == 0 {
            even.push(*value);
        } else {
            odd.push(*value);
        }
    }

    // Recursively compute FFT on even and odd parts
    fft(&mut even);
    fft(&mut odd);

    // Combine the results
    for i in 0..n / 2 {
        let t = Complex::from_polar(1.0, -2.0 * PI * i as f64 / n as f64) * odd[i];
        input[i] = even[i] + t;
        input[i + n / 2] = even[i] - t;
    }
}

// A charming struct to represent complex numbers
#[derive(Clone, Copy)]
struct Complex {
    re: f64,
    im: f64,
}

impl Complex {
    // Function to create a complex number from polar coordinates
    fn from_polar(r: f64, theta: f64) -> Complex {
        Complex {
            re: r * theta.cos(),
            im: r * theta.sin(),
        }
    }
}

// Function to add two complex numbers
impl std::ops::Add for Complex {
    type Output = Complex;

    fn add(self, other: Complex) -> Complex {
        Complex {
            re: self.re + other.re,
            im: self.im + other.im,
        }
    }
}

// Function to subtract two complex numbers
impl std::ops::Sub for Complex {
    type Output = Complex;

    fn sub(self, other: Complex) -> Complex {
        Complex {
            re: self.re - other.re,
            im: self.im - other.im,
        }
    }
}

// Function to multiply two complex numbers
impl std::ops::Mul for Complex {
    type Output = Complex;

    fn mul(self, other: Complex) -> Complex {
        Complex {
            re: self.re * other.re - self.im * other.im,
            im: self.re * other.im + self.im * other.re,
        }
    }
}

// Main function to demonstrate the FFT
fn main() {
    // Creating a vector of complex numbers
    let mut input = vec![
        Complex { re: 0.0, im: 0.0 },
        Complex { re: 1.0, im: 0.0 },
        Complex { re: 0.0,