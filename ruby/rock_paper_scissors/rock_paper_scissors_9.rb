# This program is a simple implementation of the classic game Rock, Paper, Scissors.
# The purpose of this program is to provide a basic example of how to implement game logic in Ruby.
# The program allows a user to play Rock, Paper, Scissors against the computer.
# The computer's choice is randomly generated, and the user's choice is taken as input.
# The program then determines the winner based on the rules of the game.

# Define the choices available in the game
choices = ["rock", "paper", "scissors"]

# Function to get the computer's choice
def computer_choice(choices)
    choices.sample
end

# Function to get the user's choice
def user_choice
    puts "Enter your choice (rock, paper, or scissors):"
    gets.chomp.downcase
end

# Function to determine the winner
def determine_winner(user, computer)
    if user == computer
        "It's a tie!"
    elsif (user == "rock" && computer == "scissors") ||
                (user == "paper" && computer == "rock") ||
                (user == "scissors" && computer == "paper")
        "You win!"
    else
        "Computer wins!"
    end
end

# Main program loop
loop do
    user = user_choice
    computer = computer_choice(choices)
    
    puts "You chose: #{user}"
    puts "Computer chose: #{computer}"
    
    result = determine_winner(user, computer)
    puts result
    
    puts "Do you want to play again? (yes or no)"
    break if gets.chomp.downcase != "yes"
end

