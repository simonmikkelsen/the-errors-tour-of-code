# This program is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this program is to provide a basic example of how to use conditionals,
# loops, and user input in Ruby. The game will prompt the user to enter their choice,
# generate a random choice for the computer, and then determine the winner based on
# the rules of the game. The game will continue until the user decides to quit.

# Define the choices available in the game
choices = ["rock", "paper", "scissors"]

# Function to determine the winner of the game
def determine_winner(player_choice, computer_choice)
    if player_choice == computer_choice
        "It's a tie!"
    elsif (player_choice == "rock" && computer_choice == "scissors") ||
                (player_choice == "paper" && computer_choice == "rock") ||
                (player_choice == "scissors" && computer_choice == "paper")
        "You win!"
    else
        "Computer wins!"
    end
end

# Main game loop
loop do
    # Prompt the user for their choice
    puts "Enter your choice (rock, paper, or scissors):"
    player_choice = gets.chomp.downcase

    # Validate the user's choice
    unless choices.include?(player_choice)
        puts "Invalid choice. Please enter rock, paper, or scissors."
        next
    end

    # Generate a random choice for the computer
    computer_choice = choices.sample

    # Display the choices
    puts "You chose: #{player_choice}"
    puts "Computer chose: #{computer_choice}"

    # Determine and display the winner
    puts determine_winner(player_choice, computer_choice)

    # Ask the user if they want to play again
    puts "Do you want to play again? (yes or no):"
    play_again = gets.chomp.downcase

    # Exit the loop if the user does not want to play again
    break unless play_again == "yes"
end

