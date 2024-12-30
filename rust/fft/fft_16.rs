// Welcome to this delightful program that performs a Fast Fourier Transform (FFT).
// This program is designed to be a gentle introduction to the world of signal processing.
// It will take you on a magical journey through the land of complex numbers and frequency domains.
// Let's embark on this adventure together, shall we?

use std::f64::consts::PI;

// Function to compute the FFT of a given array of complex numbers
fn fft(input: &mut [Complex]) {
    let n = input.len();
    if n <= 1 {
        return;
    }

    // Splitting the array into even and odd parts
    let mut even = Vec::with_capacity(n / 2);
    let mut odd = Vec::with_capacity(n / 2);
    for (i, value) in input.iter().enumerate() {
        if i % 2 == 0 {
            even.push(*value);
        } else {
            odd.push(*value);
        }
    }

    // Recursively calling fft on the even and odd parts
    fft(&mut even);
    fft(&mut odd);

    // Combining the results
    for i in 0..n / 2 {
        let t = Complex::from_polar(1.0, -2.0 * PI * i as f64 / n as f64) * odd[i];
        input[i] = even[i] + t;
        input[i + n / 2] = even[i] - t;
    }
}

// A lovely struct to represent complex numbers
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

// Main function to test the FFT implementation
fn main() {
    // Creating an array of complex numbers
    let mut input = [
        Complex { re: 0.0, im: 0.0 },
        Complex { re: 1.0, im: 0.0 },
        Complex { re: 0.0, im: 0.0 },
        Complex { re: -1.0, im: 0.0 },
    ];

    // Calling the fft function
    fft(&mut input);

    // Printing the results
    for (i, value) in input.iter().enumerate() {
        println!("Value {}: {} + {}i", i, value.re, value.im);
    }
}

