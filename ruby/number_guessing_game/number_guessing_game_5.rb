# This is a number guessing game where the player has to guess a number between 1 and 100.
# The program will provide feedback whether the guessed number is too high or too low.
# The game continues until the player guesses the correct number.

def number_guessing_game
    target_number = rand(1..100)
    guess = nil

    puts "Welcome to the Number Guessing Game!"
    puts "I have selected a random number between 1 and 100."
    puts "Can you guess what it is?"

    until guess == target_number
        print "Enter your guess: "
        guess = gets.to_i

        if guess < target_number
            puts "Too low!"
        elsif guess > target_number
            puts "Too high!"
        else
            puts "Congratulations! You guessed the correct number!"
        end
    end
end

number_guessing_game

