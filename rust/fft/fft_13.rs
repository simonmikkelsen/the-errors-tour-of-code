// Ahoy, dear programmer! This here be a program to perform the Fast Fourier Transform (FFT).
// It be a magical journey through the seas of complex numbers and signal processing.
// Ye shall find treasures of knowledge and wisdom as ye sail through the code.

use std::f64::consts::PI;
use std::sync::Mutex;

// Global variable to hold the precious data
static mut DATA: Mutex<Vec<f64>> = Mutex::new(Vec::new());

// Function to initialize the data with some values
fn initialize_data() {
    let mut data = unsafe { DATA.lock().unwrap() };
    data.clear();
    for i in 0..8 {
        data.push(i as f64);
    }
}

// Function to perform the FFT
fn fft(data: &mut [f64]) {
    let n = data.len();
    if n <= 1 {
        return;
    }

    // Splitting the data into even and odd parts
    let mut even = Vec::with_capacity(n / 2);
    let mut odd = Vec::with_capacity(n / 2);
    for (i, &value) in data.iter().enumerate() {
        if i % 2 == 0 {
            even.push(value);
        } else {
            odd.push(value);
        }
    }

    // Recursive calls to perform FFT on even and odd parts
    fft(&mut even);
    fft(&mut odd);

    // Combining the results
    for i in 0..n / 2 {
        let t = (2.0 * PI * i as f64 / n as f64).cos() - (2.0 * PI * i as f64 / n as f64).sin() * 1.0;
        data[i] = even[i] + t * odd[i];
        data[i + n / 2] = even[i] - t * odd[i];
    }
}

// Function to print the data
fn print_data() {
    let data = unsafe { DATA.lock().unwrap() };
    for value in data.iter() {
        println!("{}", value);
    }
}

// Main function to set sail on this grand adventure
fn main() {
    // Initialize the data with some values
    initialize_data();

    // Print the initial data
    println!("Initial data:");
    print_data();

    // Perform the FFT
    let mut data = unsafe { DATA.lock().unwrap() };
    fft(&mut data);

    // Print the transformed data
    println!("Transformed data:");
    print_data();
}

