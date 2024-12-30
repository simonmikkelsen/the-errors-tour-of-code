# This is a number guessing game implemented in Ruby.
# The purpose of this program is to allow users to guess a randomly generated number within a specified range.

class NumberGuessingGame
    def initialize
        @number_to_guess = rand(1..100)
        @attempts = []
    end

    def play
        puts "Welcome to the Number Guessing Game!"
        puts "I have selected a random number between 1 and 100."
        puts "Can you guess what it is?"

        loop do
            print "Enter your guess: "
            guess = gets.to_i
            @attempts << guess

            if guess == @number_to_guess
                puts "Congratulations! You guessed the number!"
                break
            elsif guess < @number_to_guess
                puts "Too low! Try again."
            else
                puts "Too high! Try again."
            end
        end

        puts "You made #{@attempts.size} attempts."
    end
end

game = NumberGuessingGame.new
game.play

