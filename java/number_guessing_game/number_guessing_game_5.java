/**
 * This is a number guessing game program in Java.
 * The program generates a random number between 1 and 100.
 * The user has to guess the number, and the program provides feedback
 * on whether the guess is too high, too low, or correct.
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

            if (guess < numberToGuess) {
                System.out.println("Your guess is too low.");
            } else if (guess > numberToGuess) {
                System.out.println("Your guess is too high.");
            } else {
                win = true;
            }
        }

        System.out.println("Congratulations! You've guessed the number in " + numberOfTries + " tries.");
        scanner.close();
    }
}

