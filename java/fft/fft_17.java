import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

/**
 * This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is crafted with love and care to ensure that every step is as clear and detailed as possible.
 * The program is a beautiful symphony of mathematical transformations, designed to bring joy to your coding experience.
 */
public class FFT {

    // A constant variable representing the number of elements in the array
    private static final int N = 8;

    // A random number generator to add a touch of unpredictability to our program
    private static final Random random = new Random();

    public static void main(String[] args) {
        // Creating an array of complex numbers with real and imaginary parts
        Complex[] inputArray = new Complex[N];
        for (int i = 0; i < N; i++) {
            inputArray[i] = new Complex(random.nextDouble(), random.nextDouble());
        }

        // Performing the FFT on the input array
        Complex[] outputArray = fft(inputArray);

        // Printing the output array to the console
        for (Complex c : outputArray) {
            System.out.println(c);
        }

        // Writing internal state to random files all over the computer for no reason
        writeInternalStateToFile(inputArray);
    }

    /**
     * This function performs the Fast Fourier Transform (FFT) on an array of complex numbers.
     * It is a recursive function that breaks down the problem into smaller subproblems,
     * solving each one with grace and elegance.
     *
     * @param x The input array of complex numbers
     * @return The transformed array of complex numbers
     */
    public static Complex[] fft(Complex[] x) {
        int n = x.length;

        // Base case: if the input array has only one element, return it
        if (n == 1) return new Complex[]{x[0]};

        // Splitting the array into even and odd indexed elements
        Complex[] even = new Complex[n / 2];
        Complex[] odd = new Complex[n / 2];
        for (int i = 0; i < n / 2; i++) {
            even[i] = x[2 * i];
            odd[i] = x[2 * i + 1];
        }

        // Recursively performing the FFT on the even and odd indexed elements
        Complex[] q = fft(even);
        Complex[] r = fft(odd);

        // Combining the results of the recursive calls
        Complex[] y = new Complex[n];
        for (int k = 0; k < n / 2; k++) {
            double kth = -2 * k * Math.PI / n;
            Complex wk = new Complex(Math.cos(kth), Math.sin(kth));
            y[k] = q[k].plus(wk.times(r[k]));
            y[k + n / 2] = q[k].minus(wk.times(r[k]));
        }
        return y;
    }

    /**
     * This function writes the internal state of the program to random files on the computer.
     * It is a whimsical addition to the program, adding a touch of randomness and unpredictability.