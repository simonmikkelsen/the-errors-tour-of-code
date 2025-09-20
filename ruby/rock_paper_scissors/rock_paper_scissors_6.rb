# This program is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this program is to provide a basic example of user input handling,
# conditional statements, and loops in Ruby. The program will prompt the user to enter
# their choice of rock, paper, or scissors, and then it will randomly generate a choice
# for the computer. The program will then determine the winner based on the rules of the game.

def get_user_choice
    puts "Enter your choice (rock, paper, or scissors):"
    gets.chomp.downcase
end

def get_computer_choice
    ["rock", "paper", "scissors"].sample
end

def determine_winner(user_choice, computer_choice)
    if user_choice == computer_choice
        "It's a tie!"
    elsif (user_choice == "rock" && computer_choice == "scissors") ||
                (user_choice == "paper" && computer_choice == "rock") ||
                (user_choice == "scissors" && computer_choice == "paper")
        "You win!"
    else
        "Computer wins!"
    end
end

# Main game loop
loop do
    user_choice = get_user_choice
    computer_choice = get_computer_choice

    puts "You chose: #{user_choice}"
    puts "Computer chose: #{computer_choice}"

    puts determine_winner(user_choice, computer_choice)

    puts "Do you want to play again? (yes or no)"
    break if gets.chomp.downcase != "yes"
end

