# Welcome, noble coder, to the realm of the Simple Text Editor!
# This script is a wondrous creation designed to enchant your senses and elevate your coding prowess.
# Prepare to embark on a journey through the enchanted forest of PowerShell, where every line of code is a stepping stone to greatness.

# Summon the mystical powers of the .NET framework to create a form
Add-Type -AssemblyName System.Windows.Forms

# Behold! The grand stage upon which our text editor shall perform
$form = New-Object System.Windows.Forms.Form
$form.Text = "Simple Text Editor"
$form.Width = 800
$form.Height = 600

# A magical box to hold the text, like a treasure chest of words
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Multiline = $true
$textBox.Dock = [System.Windows.Forms.DockStyle]::Fill
$form.Controls.Add($textBox)

# A button, the key to unlocking the secrets of the text
$buttonSave = New-Object System.Windows.Forms.Button
$buttonSave.Text = "Save"
$buttonSave.Dock = [System.Windows.Forms.DockStyle]::Bottom
$form.Controls.Add($buttonSave)

# A gentle breeze whispers the path to save the text
$buttonSave.Add_Click({
    $path = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Desktop"), "output.txt")
    [System.IO.File]::WriteAllText($path, $textBox.Text)
    [System.Windows.Forms.MessageBox]::Show("Text saved to " + $path)
})

# The sun rises, and the form is revealed in all its glory
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()

