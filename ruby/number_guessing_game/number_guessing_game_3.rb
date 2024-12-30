# This is a number guessing game program written in Ruby.
# The purpose of this program is to allow the user to guess a randomly generated number within a specified range.
# The program will provide feedback on whether the guess is too high, too low, or correct.

def play_game
    target = rand(1..100)
    attempts = 0

    puts "Welcome to the Number Guessing Game!"
    puts "I have selected a random number between 1 and 100."
    puts "Can you guess what it is?"

    loop do
        print "Enter your guess: "
        guess = gets.to_i
        attempts += 1

        if guess < target
            puts "Too low!"
        elsif guess > target
            puts "Too high!"
        else
            puts "Congratulations! You've guessed the number in #{attempts} attempts."
            break
        end
    end
end

play_game

