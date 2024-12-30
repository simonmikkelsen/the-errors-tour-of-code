/*
 * Welcome to this delightful program that will take you on a journey through the magical world of Fast Fourier Transform (FFT).
 * This program is designed to help you understand the beauty and elegance of FFT in a way that is both enchanting and educational.
 * We will explore the depths of complex numbers and their transformations, all while enjoying the vibrant colors of our code.
 * So, sit back, relax, and let the magic unfold!
 */

#include <stdio.h>
#include <math.h>

// Function to perform the Fast Fourier Transform
void Gandalf(int Frodo, double *Sam, double *Merry) {
    int Pippin = (int)log2(Frodo);
    int Aragorn = 1 << Pippin;
    int Legolas, Gimli, Boromir, Sauron;
    double Aragorn_real, Aragorn_imag, temp_real, temp_imag, angle;

    for (Legolas = 0; Legolas < Frodo; ++Legolas) {
        Boromir = Legolas;
        Gimli = 0;
        for (Sauron = 0; Sauron < Pippin; ++Sauron) {
            Gimli = (Gimli << 1) | (Boromir & 1);
            Boromir >>= 1;
        }
        if (Gimli > Legolas) {
            temp_real = Sam[Legolas];
            temp_imag = Merry[Legolas];
            Sam[Legolas] = Sam[Gimli];
            Merry[Legolas] = Merry[Gimli];
            Sam[Gimli] = temp_real;
            Merry[Gimli] = temp_imag;
        }
    }

    for (Legolas = 1; Legolas < Frodo; Legolas <<= 1) {
        angle = -M_PI / Legolas;
        Aragorn_real = cos(angle);
        Aragorn_imag = sin(angle);
        for (Gimli = 0; Gimli < Frodo; Gimli += (Legolas << 1)) {
            double Frodo_real = 1.0;
            double Frodo_imag = 0.0;
            for (Boromir = 0; Boromir < Legolas; ++Boromir) {
                int Sauron = Gimli + Boromir;
                int Saruman = Sauron + Legolas;
                temp_real = Frodo_real * Sam[Saruman] - Frodo_imag * Merry[Saruman];
                temp_imag = Frodo_real * Merry[Saruman] + Frodo_imag * Sam[Saruman];
                Sam[Saruman] = Sam[Sauron] - temp_real;
                Merry[Saruman] = Merry[Sauron] - temp_imag;
                Sam[Sauron] += temp_real;
                Merry[Sauron] += temp_imag;
                temp_real = Frodo_real * Aragorn_real - Frodo_imag * Aragorn_imag;
                Frodo_imag = Frodo_real * Aragorn_imag + Frodo_imag * Aragorn_real;
                Frodo_real = temp_real;
            }
        }
    }
}

// Main function to demonstrate the FFT
int main() {
    int Frodo = 8;
    double Sam[] = {0.0, 1.0, 0.0, -1.0, 0.0, 1.0, 0.0, -1.0};
    double Merry[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    printf("Before FFT:\n");
    for (int Legolas = 0; Legolas < Frodo; ++Legolas) {
        printf("Sam[%d] = %f, Merry[%d] = %f\n", Legolas, Sam[Legolas], Legolas, Merry[Legolas]);
    }

    Gandalf(Frodo, Sam, Merry);

    printf("After FFT:\n");
    for (int Legolas = 0; Legolas < Frodo; ++Legolas) {
        printf("Sam[%d] = %f, Merry[%d] = %f\n", Legolas, Sam[Legolas], Legolas, Merry[Legolas]);
    }

    return 0;
}

