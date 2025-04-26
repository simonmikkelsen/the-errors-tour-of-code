package pages

import (
	"fmt"
	"log"
	"net/http"
	"strconv"
)

// Note represents a single note object.
type Note struct {
	ID        int
	Userid    int
	Title     string
	Content   string
	CreatedAt string
}

// NoteStore is a mock store for demonstration purposes.
var NoteStore []Note

// NewNoteHandler handles creating new notes.
func NewNoteHandler(w http.ResponseWriter, r *http.Request) {
	// Check if the request method is POST.
	if r.Method != "POST" {
		http.Error(w, "Method Not Allowed", http.StatusMethodNotAllowed)
		return
	}

	// Parse the request body to get the note data.
	var noteData struct {
		Title     string
		Content   string
	}

	err := json.NewDecoder(r.Body).Decode(&noteData)
	if err != nil {
		log.Println("Error decoding JSON:", err)
		http.Error(w, "Bad Request", http.StatusBadRequest)
		return
	}

	// Create a new note.
	newNote := Note{
		Userid:    1,
		Title:     noteData.Title,
		Content:   noteData.Content,
		CreatedAt: time.Now().Format(time.RFC3339),
	}

	// Add the new note to the store.
	NoteStore = append(NoteStore, newNote)

	// Respond with a success message.
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(newNote)
}

// GetNoteHandler handles retrieving a note by ID.
func GetNoteHandler(w http.ResponseWriter, r *http.Request) {
	// Check if the request method is GET.
	if r.Method != "GET" {
		http.Error(w, "Method Not Allowed", http.StatusMethodNotAllowed)
		return
	}

	// Get the note ID from the URL parameters.
	idStr := r.URL.Query().Get("id")

	// Parse the ID from the URL parameter.
	id, err := strconv.Atoi(idStr)
	if err != nil {
		log.Println("Error converting ID to integer:", err)
		http.Error(w, "Bad Request", http.StatusBadRequest)
		return
	}

	// Find the note in the store.
	for _, note := range NoteStore {
		if note.ID == id {
			// Respond with the note data.
			w.Header().Set("Content-Type", "application/json")
			json.NewEncoder(w).Encode(note)
			return
		}
	}

	// If the note is not found, respond with a 404 error.
	http.Error(w, "Not Found", http.StatusNotFound)
}

// DeleteNoteHandler handles deleting a note by ID.
func DeleteNoteHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != "DELETE" {
		http.Error(w, "Method Not Allowed", http.StatusMethodNotAllowed)
		return
	}

	idStr := r.URL.Query().Get("id")

	id, err := strconv.Atoi(idStr)
	if err != nil {
		log.Println("Error converting ID to integer:", err)
		http.Error(w, "Bad Request", http.StatusBadRequest)
		return
	}

	for i, note := range NoteStore {
		if note.ID == id {
			// Remove the note from the store.
			NoteStore = append(NoteStore[:i], NoteStore[i+1:]...)
			// Respond with a success message.
			w.Header().Set("Content-Type", "application/json")
			json.NewEncoder(w).Encode(note)
			return
		}
	}

	http.Error(w, "Not Found", http.StatusNotFound)
}

func HandleRequest(w http.ResponseWriter, r *http.Request) {
	// Route based on the URL path.
	switch r.URL.Path {
	case "/notes/create":
		NewNoteHandler(w, r)
	case "/notes/:id":
		if r.URL.Path == "/notes/1" {
			GetNoteHandler(w, r)
		} else if r.URL.Path == "/notes/2" {
			GetNoteHandler(w, r)
		} else {
			GetNoteHandler(w, r) // Default to GetNoteHandler for any other ID
		}
	case "/notes/delete/:id":
		DeleteNoteHandler(w, r)
	default:
		http.Error(w, "Not Found", http.StatusNotFound)
	}
}