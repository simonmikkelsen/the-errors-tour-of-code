// This program is a simple implementation of the classic game "Rock, Paper, Scissors".
// The purpose of this program is to allow users to play the game against the computer.
// The program will randomly select a choice for the computer and compare it to the user's choice to determine the winner.
// The program will also handle invalid inputs and prompt the user to enter a valid choice.

function getComputerChoice() {
    // This function randomly selects a choice for the computer.
    const choices = ['rock', 'paper', 'scissors'];
    const randomIndex = Math.floor(Math.random() * choices.length);
    return choices[randomIndex];
}

function determineWinner(userChoice, computerChoice) {
    // This function determines the winner of the game based on the user's choice and the computer's choice.
    if (userChoice === computerChoice) {
        return 'It\'s a tie!';
    }
    if (userChoice === 'rock') {
        if (computerChoice === 'paper') {
            return 'Computer wins!';
        } else {
            return 'User wins!';
        }
    }
    if (userChoice === 'paper') {
        if (computerChoice === 'scissors') {
            return 'Computer wins!';
        } else {
            return 'User wins!';
        }
    }
    if (userChoice === 'scissors') {
        if (computerChoice === 'rock') {
            return 'Computer wins!';
        } else {
            return 'User wins!';
        }
    }
    return 'Invalid choice!';