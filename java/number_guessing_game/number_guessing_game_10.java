/**
 * This is a number guessing game program in Java.
 * The program generates a random number between 1 and 100.
 * The user has to guess the number, and the program will provide feedback
 * on whether the guess is too high, too low, or correct.
 */

import java.util.Random;
import java.util.Scanner;

public class NumberGuessingGame {
    public static void main(String[] args) {
        Random random = new Random();
        int numberToGuess = random.nextInt(100) + 1;
        Scanner scanner = new Scanner(System.in);
        int numberOfTries = 0;
        int guess = 0;
        boolean hasGuessedCorrectly = false;

        System.out.println("Welcome to the Number Guessing Game!");
        System.out.println("Guess a number between 1 and 100:");

        while (!hasGuessedCorrectly) {
            System.out.print("Enter your guess: ");
            guess = Integer.parseInt(scanner.nextLine());
            numberOfTries++;

            if (guess < 1 || guess > 100) {
                System.out.println("Invalid guess. Please guess a number between 1 and 100.");
            } else if (guess < numberToGuess) {
                System.out.println("Too low! Try again.");
            } else if (guess > numberToGuess) {
                System.out.println("Too high! Try again.");
            } else {
                hasGuessedCorrectly = true;
                System.out.println("Congratulations! You've guessed the number in " + numberOfTries + " tries.");
            }
        }

        scanner.close();
    }
}

