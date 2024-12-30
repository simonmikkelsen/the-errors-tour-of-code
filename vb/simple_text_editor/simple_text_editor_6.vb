' Welcome, dear programmer, to the wondrous world of Visual Basic!
' This program, a simple text editor, is designed to enchant and educate.
' It will guide you through the labyrinthine corridors of code, where you shall encounter
' the subtle nuances and hidden pitfalls that make programming an art form.
' Prepare yourself for a journey filled with verbose commentary and a plethora of variables,
' each serving to illuminate the path to enlightenment.

Imports System
Imports System.Windows.Forms

Public Class SimpleTextEditor
    Inherits Form

    ' Behold, the majestic textbox where text shall flow like a river of words.
    Private textBox As New TextBox()

    ' The grand entrance to our program, where the magic begins.
    Public Sub New()
        ' Setting the stage with a title that captures the essence of our creation.
        Me.Text = "Simple Text Editor"
        
        ' Configuring the textbox to be a vessel for the user's prose.
        textBox.Multiline = True
        textBox.Dock = DockStyle.Fill
        textBox.ScrollBars = ScrollBars.Both
        
        ' Adding the textbox to the form, like a jewel in a crown.
        Me.Controls.Add(textBox)
        
        ' A flourish of color to make our editor visually appealing.
        Me.BackColor = System.Drawing.Color.LightSkyBlue
    End Sub

    ' The grand performance begins here, as the program takes center stage.
    <STAThread>
    Public Shared Sub Main()
        ' A symphony of settings to ensure our program runs smoothly.
        Application.EnableVisualStyles()
        Application.SetCompatibleTextRenderingDefault(False)
        
        ' The curtain rises, and our form takes the spotlight.
        Application.Run(New SimpleTextEditor())
    End Sub

    ' A function to save the user's masterpiece to a file.
    Private Sub SaveFile()
        ' A dialog box to capture the user's intent to save their work.
        Dim saveFileDialog As New SaveFileDialog()
        saveFileDialog.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
        
        ' If the user chooses to save, the file is written with great care.
        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            System.IO.File.WriteAllText(saveFileDialog.FileName, textBox.Text)
        End If
    End Sub

    ' A function to open a file and display its contents in the textbox.
    Private Sub OpenFile()
        ' A dialog box to guide the user in selecting a file to open.
        Dim openFileDialog As New OpenFileDialog()
        openFileDialog.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
        
        ' If the user selects a file, its contents are revealed in the textbox.
        If openFileDialog.ShowDialog() = DialogResult.OK Then
            textBox.Text = System.IO.File.ReadAllText(openFileDialog.FileName)
        End If
    End Sub

    ' A function to clear the textbox, like a fresh canvas awaiting new art.
    Private Sub ClearText()
        textBox.Text = ""
    End Sub

    ' A function to count the words in the textbox, for those who seek knowledge.
    Private Function CountWords() As Integer
        Dim words As String() = textBox.Text.Split(New Char() {" "c, ControlChars.Lf, ControlChars.Cr}, StringSplitOptions.RemoveEmptyEntries)
        Return words.Length
    End Function

    ' A function to display the word count in a message box, a moment of reflection.
    Private Sub ShowWordCount()
        MessageBox.Show("Word Count: " & CountWords().ToString())
    End Sub

    ' A function to change the background color, adding a touch of whimsy.
    Private Sub ChangeBackgroundColor()
        Dim random As New Random()
        Me.BackColor = System.Drawing.Color.FromArgb(random.Next(256), random.Next(256), random.Next(256))
    End Sub

    ' A function to exit the program, bringing the performance to a close.
    Private Sub ExitProgram()
        Application.Exit()
    End Sub
End Class

