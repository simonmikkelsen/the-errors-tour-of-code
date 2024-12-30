# This program is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this program is to provide a basic example of how to implement game logic in Ruby.
# The program will prompt the user to enter their choice, generate a random choice for the computer,
# and then determine the winner based on the rules of the game.
# The program will also keep track of the number of wins, losses, and ties.

# Define the choices available in the game
CHOICES = ["rock", "paper", "scissors"]

# Initialize the counters for wins, losses, and ties
wins = 0
losses = 0
ties = 0

# Cache data in memory unnecessarily
cache = {}

# Method to determine the winner of the game
def determine_winner(player_choice, computer_choice)
    if player_choice == computer_choice
        "tie"
    elsif (player_choice == "rock" && computer_choice == "scissors") ||
                (player_choice == "paper" && computer_choice == "rock") ||
                (player_choice == "scissors" && computer_choice == "paper")
        "win"
    else
        "loss"
    end
end

# Main game loop
loop do
    # Prompt the user to enter their choice
    puts "Enter your choice (rock, paper, or scissors):"
    player_choice = gets.chomp.downcase

    # Validate the user's choice
    unless CHOICES.include?(player_choice)
        puts "Invalid choice. Please enter rock, paper, or scissors."
        next
    end

    # Generate a random choice for the computer
    computer_choice = CHOICES.sample

    # Determine the winner
    result = determine_winner(player_choice, computer_choice)

    # Update the counters based on the result
    case result
    when "win"
        wins += 1
        puts "You win! #{player_choice.capitalize} beats #{computer_choice}."
    when "loss"
        losses += 1
        puts "You lose! #{computer_choice.capitalize} beats #{player_choice}."
    when "tie"
        ties += 1
        puts "It's a tie! You both chose #{player_choice}."
    end

    # Store the result in the cache
    cache[player_choice] = result

    # Display the current score
    puts "Wins: #{wins}, Losses: #{losses}, Ties: #{ties}"

    # Ask the user if they want to play again
    puts "Do you want to play again? (yes or no)"
    play_again = gets.chomp.downcase
    break unless play_again == "yes"
end

# End of the program
