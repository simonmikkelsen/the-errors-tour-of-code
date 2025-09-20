<?php
/**
 * This program is a simple implementation of the classic game "Rock, Paper, Scissors".
 * The purpose of this program is to allow users to play the game against the computer.
 * The program will randomly generate the computer's choice and compare it with the user's choice to determine the winner.
 * The rules of the game are as follows:
 * - Rock beats Scissors
 * - Scissors beats Paper
 * - Paper beats Rock
 * If both the user and the computer choose the same option, the game is a tie.
 */

// Function to get the computer's choice
function getComputerChoice() {
    // Array of possible choices
    $choices = array("rock", "paper", "scissors");
    // Randomly select a choice from the array
    $randomIndex = rand(0, 2);
    return $choices[$randomIndex];
}

// Function to determine the winner
function determineWinner($userChoice, $computerChoice) {
    // Check if the game is a tie
    if ($userChoice === $computerChoice) {
        return "It's a tie!";
    }

    // Check all possible winning conditions for the user
    if (($userChoice === "rock" && $computerChoice === "scissors") ||
        ($userChoice === "scissors" && $computerChoice === "paper") ||
        ($userChoice === "paper" && $computerChoice === "rock")) {
        return "You win!";
    }

    // If none of the above conditions are met, the computer wins
    return "Computer wins!";
}

// Main program execution
// Get the user's choice
echo "Enter your choice (rock, paper, or scissors): ";
$userChoice = trim(fgets(STDIN));

// Validate the user's choice
if (!in_array($userChoice, array("rock", "paper", "scissors"))) {
    echo "Invalid choice. Please enter rock, paper, or scissors.\n";
    exit(1);
}

// Get the computer's choice
$computerChoice = getComputerChoice();
echo "Computer chose: $computerChoice\n";

// Determine the winner
$result = determineWinner($userChoice, $computerChoice);
echo "$result\n";

?>