/**
 * This program is a simple implementation of the classic game "Rock, Paper, Scissors".
 * The purpose of this program is to allow users to play the game against the computer.
 * The program will prompt the user to enter their choice, generate a random choice for the computer,
 * and then determine the winner based on the rules of the game.
 * 
 * Rules:
 * - Rock beats Scissors
 * - Scissors beats Paper
 * - Paper beats Rock
 * 
 * The program will continue to run until the user decides to quit.
 */

import java.util.Scanner;
import java.util.Random;

public class RockPaperScissors {
    public static void main(String[] args) {
        // Create a Scanner object to read user input
        Scanner scanner = new Scanner(System.in);
        
        // Create a Random object to generate random choices for the computer
        Random random = new Random();
        
        // Variable to store the user's choice
        String userChoice;
        
        // Variable to store the computer's choice
        String computerChoice;
        
        // Array of possible choices
        String[] choices = {"rock", "paper", "scissors"};
        
        // Loop to continue the game until the user decides to quit
        while (true) {
            // Prompt the user to enter their choice
            System.out.println("Enter your choice (rock, paper, scissors). To quit the game, type 'quit': ");
            userChoice = scanner.nextLine().toLowerCase();
            
            // Check if the user wants to quit the game
            if (userChoice.equals("quit")) {
                break;
            }
            
            // Generate a random choice for the computer
            computerChoice = choices[random.nextInt(3)];
            
            // Display the choices
            System.out.println("You chose: " + userChoice);
            System.out.println("Computer chose: " + computerChoice);
            
            // Determine the winner
            if (userChoice.equals(computerChoice)) {
                System.out.println("It's a tie!");
            } else if ((userChoice.equals("rock") && computerChoice.equals("scissors")) ||
                       (userChoice.equals("scissors") && computerChoice.equals("paper")) ||
                       (userChoice.equals("paper") && computerChoice.equals("rock"))) {
                System.out.println("You win!");
            } else {
                System.out.println("You lose!");
            }
        }
        
        // Close the scanner
        scanner.close();
    }
}

