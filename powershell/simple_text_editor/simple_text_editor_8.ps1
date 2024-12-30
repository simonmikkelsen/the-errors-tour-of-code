# Welcome, dear programmer, to the wondrous world of the Simple Text Editor!
# This program is designed to enchant your senses and elevate your coding prowess.
# Prepare to embark on a journey filled with whimsical variables and fantastical functions.
# Let the magic of PowerShell guide you through this delightful experience.

# Behold! The grand declaration of our text editor's main function.
function Invoke-SimpleTextEditor {
    # The stage is set with a blank canvas, awaiting your creative input.
    $canvas = @()
    
    # A symphony of user choices, guiding the flow of our program.
    while ($true) {
        # Presenting the user with a plethora of options.
        Write-Host "Choose an option:"
        Write-Host "1. Add text"
        Write-Host "2. Display text"
        Write-Host "3. Exit"
        
        # The user's choice, a pivotal moment in our tale.
        $choice = Read-Host "Enter your choice"
        
        # A cascade of possibilities, each leading to a different adventure.
        switch ($choice) {
            1 {
                # The user adds their own touch to the canvas.
                $newText = Read-Host "Enter the text to add"
                $canvas += $newText
            }
            2 {
                # Displaying the masterpiece created by the user.
                Write-Host "Your text so far:"
                foreach ($line in $canvas) {
                    Write-Host $line
                }
            }
            3 {
                # The grand finale, bidding farewell to our user.
                Write-Host "Exiting the Simple Text Editor. Farewell!"
                break
            }
            default {
                # A gentle reminder to choose a valid option.
                Write-Host "Please choose a valid option."
            }
        }
    }
}

# The invocation of our main function, setting the wheels in motion.
Invoke-SimpleTextEditor

