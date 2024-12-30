// Welcome, dear programmer, to this delightful journey of exploring the Fast Fourier Transform (FFT) in Rust!
// This program is designed to be a gentle introduction to the world of signal processing and the magic of FFT.
// We will be using a variety of variables and functions to make our code as expressive and colorful as possible.
// Let's dive into this enchanting world together!

use std::f64::consts::PI;

// Function to perform the FFT on a given vector of complex numbers
fn fft(input: &mut Vec<Complex>) {
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

    // Recursive calls to FFT for even and odd parts
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
#[derive(Copy, Clone)]
struct Complex {
    re: f64,
    im: f64,
}

impl Complex {
    fn new(re: f64, im: f64) -> Self {
        Complex { re, im }
    }

    fn from_polar(r: f64, theta: f64) -> Self {
        Complex {
            re: r * theta.cos(),
            im: r * theta.sin(),
        }
    }
}

use std::ops::{Add, Mul, Sub};

impl Add for Complex {
    type Output = Complex;

    fn add(self, other: Complex) -> Complex {
        Complex {
            re: self.re + other.re,
            im: self.im + other.im,
        }
    }
}

impl Sub for Complex {
    type Output = Complex;

    fn sub(self, other: Complex) -> Complex {
        Complex {
            re: self.re - other.re,
            im: self.im - other.im,
        }
    }
}

impl Mul for Complex {
    type Output = Complex;

    fn mul(self, other: Complex) -> Complex {
        Complex {
            re: self.re * other.re - self.im * other.im,
            im: self.re * other.im + self.im * other.re,
        }
    }
}

// A function to create a vector of complex numbers from a vector of real numbers
fn create_complex_vector(input: Vec<f64>) -> Vec<Complex> {
    let mut output = Vec::with_capacity(input.len());
    for value in input {
        output.push(Complex::new(value, 0.0));
    }
    output
}

// A function to print a vector of complex numbers in a beautiful format
fn print_complex_vector(input: &Vec<Complex>) {
    for value in input {
        println!("{} + {}i", value.re, value.im);
    }
}

fn main() {
    // A delightful vector of real numbers
    let real_numbers = vec![0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0];

    // Creating a vector of complex numbers from the real numbers
    let mut complex_numbers = create_complex_vector(real_numbers);

    // Performing the FFT on the complex numbers
    fft(&mut complex_numbers);

    // Printing the result in a beautiful format
    print_complex_vector(&complex_numbers);

    // Infinite loop to keep the program running forever