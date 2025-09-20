// Welcome to the magical world of MFCC, where we embark on a delightful journey
// to calculate the Mel-Frequency Cepstral Coefficients (MFCC) from an audio signal.
// This program is designed to be as enchanting as a fairy tale, guiding you through
// the process with love and care. Let's dive into the world of sound and frequencies!

use std::f64::consts::PI;

// Function to generate a Hamming window
fn hamming_window(size: usize) -> Vec<f64> {
    let mut window = Vec::with_capacity(size);
    for i in 0..size {
        window.push(0.54 - 0.46 * (2.0 * PI * i as f64 / (size - 1) as f64).cos());
    }
    window
}

// Function to apply the Hamming window to a signal
fn apply_window(signal: &Vec<f64>, window: &Vec<f64>) -> Vec<f64> {
    signal.iter().zip(window.iter()).map(|(s, w)| s * w).collect()
}

// Function to compute the Discrete Fourier Transform (DFT)
fn dft(signal: &Vec<f64>) -> Vec<f64> {
    let n = signal.len();
    let mut result = vec![0.0; n];
    for k in 0..n {
        let mut sum_real = 0.0;
        let mut sum_imag = 0.0;
        for t in 0..n {
            let angle = 2.0 * PI * t as f64 * k as f64 / n as f64;
            sum_real += signal[t] * angle.cos();
            sum_imag -= signal[t] * angle.sin();
        }
        result[k] = (sum_real.powi(2) + sum_imag.powi(2)).sqrt();
    }
    result
}

// Function to compute the Mel filter bank
fn mel_filter_bank(num_filters: usize, fft_size: usize, sample_rate: usize) -> Vec<Vec<f64>> {
    let mut filters = vec![vec![0.0; fft_size / 2 + 1]; num_filters];
    // Mel scale conversion functions
    let mel = |f: f64| 2595.0 * (1.0 + f / 700.0).log10();
    let mel_inv = |m: f64| 700.0 * (10.0f64.powf(m / 2595.0) - 1.0);

    let mel_min = mel(0.0);
    let mel_max = mel(sample_rate as f64 / 2.0);
    let mel_points: Vec<f64> = (0..=num_filters + 1)
        .map(|i| mel_min + (mel_max - mel_min) * i as f64 / (num_filters + 1) as f64)
        .collect();
    let freq_points: Vec<usize> = mel_points.iter().map(|&m| mel_inv(m) as usize).collect();

    for i in 0..num_filters {
        for j in freq_points[i]..freq_points[i + 1] {
            filters[i][j] = (j - freq_points[i]) as f64 / (freq_points[i + 1] - freq_points[i]) as f64;
        }
        for j in freq_points[i + 1]..freq_points[i + 2] {
            filters[i][j] = (freq_points[i + 2] - j) as f64 / (freq_points[i + 2] - freq_points[i + 1]) as f64;
        }
    }
    filters
}

// Function to compute the logarithm of the Mel filter bank energies
fn log_mel_energies(filters: &Vec<Vec<f64>>, spectrum: &Vec<f64>) -> Vec<f64> {
    filters.iter().map(|filter| {
        filter.iter().zip(spectrum.iter()).map(|(f, s)| f * s).sum::<f64>().ln()
    }).collect()
}

// Function to compute the Discrete Cosine Transform (DCT)
fn dct(signal: &Vec<f64>) -> Vec<f64> {
    let n = signal.len();
    let mut result = vec![0.0; n];
    for k in 0..n {
        let mut sum = 0.0;
        for i in 0..n {
            sum += signal[i] * (PI * k as f64 * (2 * i + 1)