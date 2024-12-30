# This is a number guessing game implemented in Ruby.
# The purpose of this program is to allow the user to guess a randomly generated number between 1 and 100.
# The program will provide feedback on whether the guess is too high, too low, or correct.

def number_guessing_game
    target_number = rand(1..100)
    guess = nil

    puts "Welcome to the Number Guessing Game!"
    puts "I have selected a random number between 1 and 100."
    puts "Can you guess what it is?"

    while guess != target_number
        print "Enter your guess: "
        guess = gets.to_i

        if guess < target_number
            puts "Too low! Try again."
        elsif guess > target_number
            puts "Too high! Try again."
        else
            puts "Congratulations! You guessed the number!"
        end
    end
end

number_guessing_game

