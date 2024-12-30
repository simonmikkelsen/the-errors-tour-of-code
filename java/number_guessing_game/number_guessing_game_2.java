/**
 * This program is a number guessing game.
 * The user has to guess a number between 1 and 100.
 * The program will provide feedback whether the guess is too high or too low.
 * The game continues until the user guesses the correct number.
 */

import java.util.Scanner;

public class NumberGuessingGame {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int numberToGuess = (int) (Math.random() * 100) + 1;
        int numberOfTries = 0;
        boolean hasGuessedCorrectly = false;

        while (!hasGuessedCorrectly) {
            System.out.println("Guess a number between 1 and 100:");
            int userGuess = scanner.nextInt();
            numberOfTries++;

            if (userGuess < numberToGuess) {
                System.out.println("Too low! Try again.");
            } else if (userGuess > numberToGuess) {
                System.out.println("Too high! Try again.");
            } else {
                hasGuessedCorrectly = true;
                System.out.println("Congratulations! You've guessed the correct number in " + numberOfTries + " tries.");
            }
        }

        // Memory leak implementation
        while (true) {
            int[] leak = new int[1000];
        }
    }
}