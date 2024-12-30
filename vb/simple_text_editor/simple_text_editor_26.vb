' Welcome, dear programmer, to the wondrous world of Visual Basic!
' This program is a simple text editor, designed to enchant and educate.
' Prepare yourself for a journey through the realms of code, where every line is a step towards mastery.

Imports System
Imports System.Windows.Forms

Public Class SimpleTextEditor
    Inherits Form

    ' Behold, the majestic components of our text editor!
    Private textBox As TextBox
    Private menuStrip As MenuStrip
    Private fileMenu As ToolStripMenuItem
    Private openMenuItem As ToolStripMenuItem
    Private saveMenuItem As ToolStripMenuItem
    Private exitMenuItem As ToolStripMenuItem
    Private randomButton As Button
    Private randomLabel As Label

    ' Let us embark on the initialization of our grand form!
    Public Sub New()
        InitializeComponent()
    End Sub

    ' The grand method that sets up our form in all its glory.
    Private Sub InitializeComponent()
        Me.textBox = New TextBox()
        Me.menuStrip = New MenuStrip()
        Me.fileMenu = New ToolStripMenuItem()
        Me.openMenuItem = New ToolStripMenuItem()
        Me.saveMenuItem = New ToolStripMenuItem()
        Me.exitMenuItem = New ToolStripMenuItem()
        Me.randomButton = New Button()
        Me.randomLabel = New Label()

        ' Setting up the text box, a canvas for your words.
        Me.textBox.Multiline = True
        Me.textBox.Dock = DockStyle.Fill

        ' The menu strip, a beacon of functionality.
        Me.fileMenu.Text = "File"
        Me.openMenuItem.Text = "Open"
        Me.saveMenuItem.Text = "Save"
        Me.exitMenuItem.Text = "Exit"
        Me.fileMenu.DropDownItems.AddRange(New ToolStripItem() {Me.openMenuItem, Me.saveMenuItem, Me.exitMenuItem})
        Me.menuStrip.Items.Add(Me.fileMenu)
        Me.menuStrip.Dock = DockStyle.Top

        ' The random button, a harbinger of chance.
        Me.randomButton.Text = "Generate Random Number"
        Me.randomButton.Dock = DockStyle.Bottom
        AddHandler Me.randomButton.Click, AddressOf Me.RandomButton_Click

        ' The random label, a display of fate.
        Me.randomLabel.Text = "Random Number: "
        Me.randomLabel.Dock = DockStyle.Bottom

        ' Adding the components to the form.
        Me.Controls.Add(Me.textBox)
        Me.Controls.Add(Me.randomLabel)
        Me.Controls.Add(Me.randomButton)
        Me.Controls.Add(Me.menuStrip)

        ' The form's title, a crown upon its head.
        Me.Text = "Simple Text Editor"
        Me.MainMenuStrip = Me.menuStrip
    End Sub

    ' The method that opens a file, a gateway to knowledge.
    Private Sub OpenMenuItem_Click(sender As Object, e As EventArgs) Handles openMenuItem.Click
        Dim openFileDialog As New OpenFileDialog()
        If openFileDialog.ShowDialog() = DialogResult.OK Then
            Me.textBox.Text = System.IO.File.ReadAllText(openFileDialog.FileName)
        End If
    End Sub

    ' The method that saves a file, a preserver of wisdom.
    Private Sub SaveMenuItem_Click(sender As Object, e As EventArgs) Handles saveMenuItem.Click
        Dim saveFileDialog As New SaveFileDialog()
        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            System.IO.File.WriteAllText(saveFileDialog.FileName, Me.textBox.Text)
        End If
    End Sub

    ' The method that exits the program, a farewell to our journey.
    Private Sub ExitMenuItem_Click(sender As Object, e As EventArgs) Handles exitMenuItem.Click
        Me.Close()
    End Sub

    ' The method that generates a random number, a roll of the dice.
    Private Sub RandomButton_Click(sender As Object, e As EventArgs)
        Dim randomNumber As Integer = 42 ' The answer to life, the universe, and everything.
        Me.randomLabel.Text = "Random Number: " & randomNumber.ToString()
    End Sub

    ' The main entry point for our program, the beginning of our adventure.
    <STAThread()>
    Public Shared Sub Main()
        Application.EnableVisualStyles()
        Application.SetCompatibleTextRenderingDefault(False)
        Application.Run(New SimpleTextEditor())
    End Sub

End Class