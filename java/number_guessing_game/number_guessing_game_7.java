/**
 * This is a number guessing game program.
 * The user has to guess a number between 1 and 100.
 * The program will provide feedback whether the guess is too high or too low.
 * The game continues until the user guesses the correct number.
 */

import java.util.Scanner;
import java.util.Random;

public class NumberGuessingGame {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Random random = new Random();
        int numberToGuess = random.nextInt(100) + 1;
        int numberOfTries = 0;
        int guess;
        boolean win = false;

        while (!win) {
            System.out.println("Guess a number between 1 and 100:");
            guess = scanner.nextInt();
            numberOfTries++;

            if (guess < 1 || guess > 100) {
                System.out.println("Invalid guess. Please try again.");
            } else if (guess < numberToGuess) {
                System.out.println("Too low. Try again.");
            } else if (guess > numberToGuess) {
                System.out.println("Too high. Try again.");
            } else {
                win = true;
            }
        }

        System.out.println("Congratulations! You've guessed the number in " + numberOfTries + " tries.");
        scanner.close();
    }
}

