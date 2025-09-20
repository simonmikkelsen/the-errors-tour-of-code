/**
 * This program is a number guessing game.
 * The user has to guess a number between 1 and 100.
 * The program will provide feedback if the guess is too high or too low.
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
            }
        }

        System.out.println("Congratulations! You've guessed the correct number.");
        System.out.println("It took you " + numberOfTries + " tries.");
    }
}

