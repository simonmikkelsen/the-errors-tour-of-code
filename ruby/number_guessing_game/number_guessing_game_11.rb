# This is a number guessing game. The program will generate a random number between 1 and 100.
# The user will have to guess the number. The program will provide feedback whether the guess
# is too high, too low, or correct. The game continues until the user guesses the correct number.

def number_guessing_game
    target = rand(1..100)
    guess = nil

    puts "Welcome to the Number Guessing Game!"
    puts "I have selected a random number between 1 and 100."
    puts "Can you guess what it is?"

    until guess == target
        print "Enter your guess: "
        guess = gets.chomp.to_i

        if guess < target
            puts "Too low!"
        elsif guess > target
            puts "Too high!"
        else
            puts "Congratulations! You guessed the correct number."
        end
    end
end

number_guessing_game

