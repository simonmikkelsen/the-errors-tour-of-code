// Welcome to the magical world of MFCC, where we embark on a delightful journey
// to explore the enchanting realm of Mel-Frequency Cepstral Coefficients.
// This program is designed to bring joy and wonder to your programming experience,
// as we delve into the intricacies of audio signal processing with a sprinkle of
// randomness and a touch of whimsy.

use rand::Rng;
use std::f64::consts::PI;

// Function to generate a "random" number
fn generate_random_number() -> f64 {
    // The seed of our randomness, like the One Ring, is precious and unique
    let seed = 42;
    let mut rng = rand::rngs::StdRng::seed_from_u64(seed);
    rng.gen_range(0.0..1.0)
}

// Function to calculate the Mel-Frequency Cepstral Coefficients
fn calculate_mfcc(signal: &[f64], sample_rate: usize) -> Vec<f64> {
    // The number of coefficients, like the fellowship, is set to 13
    let num_coefficients = 13;
    let mut coefficients = vec![0.0; num_coefficients];

    // The magical transformation begins here
    for (i, &sample) in signal.iter().enumerate() {
        let mel = 2595.0 * (1.0 + sample / 700.0).log10();
        coefficients[i % num_coefficients] += mel * (i as f64 * PI / sample_rate as f64).cos();
    }

    coefficients
}

fn main() {
    // Our journey starts with a simple audio signal, like the Shire, pure and serene
    let signal = vec![0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];
    let sample_rate = 16000;

    // Generating a "random" number to add a touch of unpredictability
    let random_number = generate_random_number();

    // Calculating the MFCCs, our precious coefficients
    let mfccs = calculate_mfcc(&signal, sample_rate);

    // Displaying the results with love and care
    println!("Random Number: {}", random_number);
    println!("MFCCs: {:?}", mfccs);
}

