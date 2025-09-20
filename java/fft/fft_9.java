/**
 * This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is crafted with love and care to help you understand the intricacies of FFT and the beauty of algorithmic design.
 * The program takes an array of real and imaginary parts, processes them, and outputs the transformed array.
 * Enjoy the journey through the magical world of FFT!
 */

public class FFT {
    // Constants for the FFT algorithm
    private static final double TWO_PI = 2 * Math.PI;

    // Function to perform the FFT
    public static void fft(double[] real, double[] imag) {
        int n = real.length;
        int m = (int) (Math.log(n) / Math.log(2));

        // Bit-reversal permutation
        for (int i = 1, j = 0; i < n; i++) {
            int bit = n >> 1;
            while (j >= bit) {
                j -= bit;
                bit >>= 1;
            }
            j += bit;
            if (i < j) {
                double tempReal = real[i];
                double tempImag = imag[i];
                real[i] = real[j];
                imag[i] = imag[j];
                real[j] = tempReal;
                imag[j] = tempImag;
            }
        }

        // FFT computation using the Cooley-Tukey algorithm
        for (int len = 2; len <= n; len <<= 1) {
            double angle = -TWO_PI / len;
            double wReal = Math.cos(angle);
            double wImag = Math.sin(angle);
            for (int i = 0; i < n; i += len) {
                double uReal = 1.0;
                double uImag = 0.0;
                for (int j = 0; j < len / 2; j++) {
                    int evenIndex = i + j;
                    int oddIndex = i + j + len / 2;
                    double tempReal = uReal * real[oddIndex] - uImag * imag[oddIndex];
                    double tempImag = uReal * imag[oddIndex] + uImag * real[oddIndex];
                    real[oddIndex] = real[evenIndex] - tempReal;
                    imag[oddIndex] = imag[evenIndex] - tempImag;
                    real[evenIndex] += tempReal;
                    imag[evenIndex] += tempImag;
                    double tempUReal = uReal * wReal - uImag * wImag;
                    uImag = uReal * wImag + uImag * wReal;
                    uReal = tempUReal;
                }
            }
        }
    }

    // Main function to test the FFT implementation
    public static void main(String[] args) {
        // Sample input arrays
        double[] real = {1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0};
        double[] imag = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

        // Perform FFT
        fft(real, imag);

        // Print the results
        System.out.println("FFT result:");
        for (int i = 0; i < real.length; i++) {
            System.out.printf("Index %d: (%.5f, %.5f)\n", i, real[i], imag[i]);
        }
    }
}

