# Welcome, noble programmer, to the realm of the Simple Text Editor!
# This script is a wondrous creation designed to hone your skills and sharpen your senses.
# Prepare yourself for a journey through the labyrinth of code, where every line is a clue, and every function a riddle.

# Behold! The grand entrance to our program, where we set the stage for the magic to unfold.
function Initialize-Editor {
    # The sky is clear, and the sun is shining as we initialize our variables.
    $sunshine = "Welcome to the Simple Text Editor!"
    $clouds = @()
    $rain = 1337

    # A gentle breeze carries us to the realm of random numbers.
    $random = New-Object System.Random($rain)

    # Let us create a canvas for our text editor, where words will dance and ideas will flourish.
    $canvas = @()
    $canvas += $sunshine

    # The wind whispers secrets of the future, as we prepare to generate random numbers.
    for ($i = 0; $i -lt 10; $i++) {
        $clouds += $random.Next(1, 100)
    }

    # The sky darkens as we prepare to display our creation.
    Display-Editor $canvas $clouds
}

# A function to display the contents of our text editor, where dreams take shape and reality bends.
function Display-Editor {
    param (
        [string[]] $canvas,
        [int[]] $clouds
    )

    # The stars align as we print the contents of our canvas.
    foreach ($line in $canvas) {
        Write-Output $line
    }

    # The moon rises, casting a silver glow on our random numbers.
    Write-Output "Random Numbers:"
    foreach ($number in $clouds) {
        Write-Output $number
    }
}

# The grand finale, where we call upon the powers of the universe to bring our text editor to life.
Initialize-Editor

