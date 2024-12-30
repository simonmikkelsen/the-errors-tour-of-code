' Welcome, dear programmer, to the realm of the Simple Text Editor!
' This program is a delightful concoction designed to provide you with a basic text editing experience.
' Bask in the glory of its simplicity and elegance, as it allows you to open, edit, and save text files with ease.
' Prepare yourself for a journey through the wondrous world of Visual Basic, where every line of code is a brushstroke on the canvas of creativity.

Public Class SimpleTextEditor
    ' Behold, the majestic form that shall house our text editor!
    Private Sub SimpleTextEditor_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Let us set the stage with a blank canvas, ready to be filled with the musings of the user.
        Me.Text = "Simple Text Editor"
        Me.Width = 800
        Me.Height = 600
    End Sub

    ' A textbox, the heart and soul of our editor, where words shall flow like a river.
    Private WithEvents txtEditor As New TextBox With {
        .Multiline = True,
        .Dock = DockStyle.Fill,
        .Font = New Font("Consolas", 12)
    }

    ' A menu, the guiding light that shall lead the user through the labyrinth of options.
    Private WithEvents menuStrip As New MenuStrip
    Private WithEvents fileMenu As New ToolStripMenuItem("File")
    Private WithEvents openMenuItem As New ToolStripMenuItem("Open")
    Private WithEvents saveMenuItem As New ToolStripMenuItem("Save")
    Private WithEvents exitMenuItem As New ToolStripMenuItem("Exit")

    ' Let us embark on the journey of initializing our components.
    Private Sub InitializeComponent()
        ' Adding the textbox to the form.
        Me.Controls.Add(txtEditor)

        ' Adding the menu items to the menu strip.
        fileMenu.DropDownItems.Add(openMenuItem)
        fileMenu.DropDownItems.Add(saveMenuItem)
        fileMenu.DropDownItems.Add(exitMenuItem)
        menuStrip.Items.Add(fileMenu)
        Me.Controls.Add(menuStrip)
        Me.MainMenuStrip = menuStrip
    End Sub

    ' The grand opening ceremony, where the user shall be invited to select a file to open.
    Private Sub OpenMenuItem_Click(sender As Object, e As EventArgs) Handles openMenuItem.Click
        Dim openFileDialog As New OpenFileDialog With {
            .Filter = "Text Files|*.txt|All Files|*.*"
        }
        If openFileDialog.ShowDialog() = DialogResult.OK Then
            txtEditor.Text = IO.File.ReadAllText(openFileDialog.FileName)
        End If
    End Sub

    ' The moment of preservation, where the user's words shall be saved for posterity.
    Private Sub SaveMenuItem_Click(sender As Object, e As EventArgs) Handles saveMenuItem.Click
        Dim saveFileDialog As New SaveFileDialog With {
            .Filter = "Text Files|*.txt|All Files|*.*"
        }
        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            IO.File.WriteAllText(saveFileDialog.FileName, txtEditor.Text)
        End If
    End Sub

    ' The final curtain call, where the user shall bid adieu to the editor.
    Private Sub ExitMenuItem_Click(sender As Object, e As EventArgs) Handles exitMenuItem.Click
        Me.Close()
    End Sub

    ' The grand entry point of our program, where the magic begins.
    Public Shared Sub Main()
        Application.EnableVisualStyles()
        Application.SetCompatibleTextRenderingDefault(False)
        Application.Run(New SimpleTextEditor())
    End Sub
End Class

