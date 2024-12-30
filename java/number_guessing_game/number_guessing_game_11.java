/**
 * This is a number guessing game program.
 * The program generates a random number between 1 and 100.
 * The user has to guess the number, and the program will provide feedback.
 * The game continues until the user guesses the correct number.
 */

import java.util.Random;
import java.util.Scanner;

public class NumberGuessingGame {
    public static void main(String[] args) {
        Random random = new Random();
        int numberToGuess = random.nextInt(100) + 1;
        Scanner scanner = new Scanner(System.in);
        int numberOfTries = 0;
        int guess;
        boolean hasGuessedCorrectly = false;

        System.out.println("Welcome to the Number Guessing Game!");
        System.out.println("Guess a number between 1 and 100:");

        while (!hasGuessedCorrectly) {
            guess = scanner.nextInt();
            numberOfTries++;

            if (guess < numberToGuess) {
                System.out.println("Too low! Try again:");
            } else if (guess > numberToGuess) {
                System.out.println("Too high! Try again:");
            } else {
                hasGuessedCorrectly = true;
                System.out.println("Congratulations! You've guessed the correct number in " + numberOfTries + " tries.");
            }
        }
    }
}

