// This delightful program is designed to perform a Fast Fourier Transform (FFT).
// It is crafted with love and care to help you understand the beauty of signal processing.
// The FFT is a magical algorithm that transforms a signal from its original domain
// (often time or space) to a representation in the frequency domain and vice versa.

use std::f64::consts::PI;

// Function to compute the FFT of a given signal
fn fft(signal: &mut [f64]) {
    let n = signal.len();
    if n <= 1 {
        return;
    }

    // Splitting the signal into even and odd parts
    let mut even = Vec::with_capacity(n / 2);
    let mut odd = Vec::with_capacity(n / 2);
    for i in 0..n {
        if i % 2 == 0 {
            even.push(signal[i]);
        } else {
            odd.push(signal[i]);
        }
    }

    // Recursively calling fft on the even and odd parts
    fft(&mut even);
    fft(&mut odd);

    // Combining the results
    for i in 0..n / 2 {
        let t = (2.0 * PI * i as f64 / n as f64).cos() - (2.0 * PI * i as f64 / n as f64).sin() * odd[i];
        signal[i] = even[i] + t;
        signal[i + n / 2] = even[i] - t;
    }
}

// A charming function to print the signal
fn print_signal(signal: &[f64]) {
    for value in signal {
        println!("{:.4}", value);
    }
}

// The main function where the magic begins
fn main() {
    // A lovely signal to be transformed
    let mut signal = vec![0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0, -1.0];

    // Printing the original signal
    println!("Original Signal:");
    print_signal(&signal);

    // Performing the FFT
    fft(&mut signal);

    // Printing the transformed signal
    println!("Transformed Signal:");
    print_signal(&signal);
}

