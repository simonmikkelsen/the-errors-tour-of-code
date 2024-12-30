# Ahoy, matey! This be a simple text editor program, crafted with the finest of intentions to aid ye in the grand adventure of programming. 
# This here script will let ye open, edit, and save text files with the ease of a seasoned sailor navigating the seven seas.
# Prepare yerself for a journey through the code, where ye'll encounter many a variable and function, each with a tale to tell.

# Set sail with the global variable, arrr!
$global:seaBreeze = ""

# Function to open a text file and read its contents
function Open-TextFile {
    param (
        [string]$filePath
    )
    # Hoist the sails and read the file, ye scallywag!
    $global:seaBreeze = Get-Content -Path $filePath -Raw
}

# Function to edit the text content
function Edit-Text {
    param (
        [string]$newText
    )
    # Swab the deck with the new text, arrr!
    $global:seaBreeze = $newText
}

# Function to save the text content to a file
function Save-TextFile {
    param (
        [string]$filePath
    )
    # Batten down the hatches and save the file, ye landlubber!
    Set-Content -Path $filePath -Value $global:seaBreeze
}

# Function to display the current text content
function Display-Text {
    # Spyglass to view the text, arrr!
    Write-Output $global:seaBreeze
}

# Function to clear the text content
function Clear-Text {
    # Clear the decks, ye swabs!
    $global:seaBreeze = ""
}

# Main function to navigate the text editor
function Main {
    # Chart yer course with the main menu, arrr!
    while ($true) {
        Write-Output "1. Open Text File"
        Write-Output "2. Edit Text"
        Write-Output "3. Save Text File"
        Write-Output "4. Display Text"
        Write-Output "5. Clear Text"
        Write-Output "6. Exit"
        $choice = Read-Host "Choose an option"

        switch ($choice) {
            1 { 
                $filePath = Read-Host "Enter the file path"
                Open-TextFile -filePath $filePath 
            }
            2 { 
                $newText = Read-Host "Enter the new text"
                Edit-Text -newText $newText 
            }
            3 { 
                $filePath = Read-Host "Enter the file path"
                Save-TextFile -filePath $filePath 
            }
            4 { 
                Display-Text 
            }
            5 { 
                Clear-Text 
            }
            6 { 
                break 
            }
            default { 
                Write-Output "Invalid choice, ye scurvy dog!" 
            }
        }
    }
}

# Cast off and run the main function, arrr!
Main

