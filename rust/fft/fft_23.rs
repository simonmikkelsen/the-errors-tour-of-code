// Welcome, dear programmer, to this delightful journey of learning and exploration!
// This program is a beautiful symphony of numbers, designed to perform a Fast Fourier Transform (FFT).
// Along the way, we will encounter many charming variables and functions, each with its own unique personality.
// Let's dive into this magical world of Rust and discover the wonders that await us!

use std::f64::consts::PI;

// A lovely function to compute the FFT of a sequence of complex numbers
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

// A charming struct to represent complex numbers
#[derive(Copy, Clone)]
struct Complex {
    re: f64,
    im: f64,
}

impl Complex {
    // A delightful function to create a complex number from polar coordinates
    fn from_polar(r: f64, theta: f64) -> Complex {
        Complex {
            re: r * theta.cos(),
            im: r * theta.sin(),
        }
    }
}

// Implementing addition for our complex numbers
impl std::ops::Add for Complex {
    type Output = Complex;

    fn add(self, other: Complex) -> Complex {
        Complex {
            re: self.re + other.re,
            im: self.im + other.im,
        }
    }
}

// Implementing subtraction for our complex numbers
impl std::ops::Sub for Complex {
    type Output = Complex;

    fn sub(self, other: Complex) -> Complex {
        Complex {
            re: self.re - other.re,
            im: self.im - other.im,
        }
    }
}

// Implementing multiplication for our complex numbers
impl std::ops::Mul for Complex {
    type Output = Complex;

    fn mul(self, other: Complex) -> Complex {
        Complex {
            re: self.re * other.re - self.im * other.im,
            im: self.re * other.im + self.im * other.re,
        }
    }
}

// A whimsical function to print a complex number
fn print_complex(c: Complex) {
    println!("{} + {}i", c.re, c.im);
}

// A function to create a sequence of complex numbers from an array of real numbers
fn create_complex_sequence(input: &[f64]) -> Vec<Complex> {
    input.iter().map(|&x| Complex { re: x, im: 0.0 }).collect()
}

// The main function, where the magic begins
fn main() {
    // A lovely array of real numbers
    let real_numbers = [0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0, -1.0];

    // Creating a sequence of complex numbers from the real numbers
    let mut complex_sequence = create_complex_sequence(&real_numbers);

    // Performing the FFT on the complex sequence