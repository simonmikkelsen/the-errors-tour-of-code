/**
 * This is a number guessing game program in Java.
 * The program generates a random number between 1 and 100.
 * The user has to guess the number, and the program will provide feedback.
 * The game continues until the user guesses the correct number.
 */

import java.util.Random;
import java.util.Scanner;

public class NumberGuessingGame {
    public static void main(String[] args) {
        Random random = new Random();
        Scanner scanner = new Scanner(System.in);
        int numberToGuess = random.nextInt(100) + 1;
        int guess = 0;

        while (guess != numberToGuess) {
            System.out.print("Enter your guess (1-100): ");
            guess = scanner.nextInt();

            if (guess < numberToGuess) {
                System.out.println("Too low, try again.");
            } else if (guess > numberToGuess) {
                System.out.println("Too high, try again.");
            } else {
                System.out.println("Congratulations! You guessed the number.");
            }
        }

    }
}