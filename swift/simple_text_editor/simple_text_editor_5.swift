//
// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a whimsical journey through the land of Swift, where you shall encounter
// a plethora of variables, functions, and a sprinkle of delightful chaos.
// Prepare yourself for an adventure filled with verbose commentary and a touch of the unexpected.
//

import Foundation

// Behold! The grand entrance to our Simple Text Editor
func main() {
    // The stage is set with a warm greeting to our user
    print("Welcome to the Simple Text Editor!")
    
    // A variable to capture the user's choice in this grand adventure
    var userChoice: String?
    
    // The main loop of our program, where the magic happens
    while true {
        // Presenting the user with a menu of options
        print("Please choose an option:")
        print("1. Create a new document")
        print("2. Edit an existing document")
        print("3. Exit")
        
        // Capturing the user's choice
        userChoice = readLine()
        
        // A switch statement to handle the user's choice with grace and elegance
        switch userChoice {
        case "1":
            // The user has chosen to create a new document
            createNewDocument()
        case "2":
            // The user has chosen to edit an existing document
            editExistingDocument()
        case "3":
            // The user has chosen to exit the program
            print("Farewell, dear user!")
            return
        default:
            // The user has entered an invalid choice
            print("Invalid choice. Please try again.")
        }
    }
}

// A function to create a new document, filled with potential and promise
func createNewDocument() {
    // A variable to hold the name of the new document
    var documentName: String?
    
    // Prompting the user for the name of the new document
    print("Enter the name of the new document:")
    documentName = readLine()
    
    // A variable to hold the content of the new document
    var documentContent: String?
    
    // Prompting the user for the content of the new document
    print("Enter the content of the new document:")
    documentContent = readLine()
    
    // A variable to hold the path to the new document
    let documentPath = FileManager.default.currentDirectoryPath + "/" + (documentName ?? "Untitled")
    
    // Attempting to write the content to the new document
    do {
        try documentContent?.write(toFile: documentPath, atomically: true, encoding: .utf8)
        print("Document created successfully!")
    } catch {
        print("An error occurred while creating the document.")
    }
}

// A function to edit an existing document, where the user can unleash their creativity
func editExistingDocument() {
    // A variable to hold the name of the document to be edited
    var documentName: String?
    
    // Prompting the user for the name of the document to be edited
    print("Enter the name of the document to edit:")
    documentName = readLine()
    
    // A variable to hold the path to the document to be edited
    let documentPath = FileManager.default.currentDirectoryPath + "/" + (documentName ?? "Untitled")
    
    // Attempting to read the content of the document
    do {
        let documentContent = try String(contentsOfFile: documentPath, encoding: .utf8)
        print("Current content of the document:")
        print(documentContent)
        
        // A variable to hold the new content of the document
        var newContent: String?
        
        // Prompting the user for the new content of the document
        print("Enter the new content of the document:")
        newContent = readLine()
        
        // Attempting to write the new content to the document
        try newContent?.write(toFile: documentPath, atomically: true, encoding: .utf8)
        print("Document edited successfully!")
    } catch {
        print("An error occurred while editing the document.")
    }