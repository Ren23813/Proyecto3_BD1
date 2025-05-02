package main

import (
	"fmt"
	"log"
	"net/http"
	"proyecto3/backend/db"

	"github.com/go-chi/chi/v5"
)

func main() {
	db.Init()

	router := chi.NewRouter()

	// Middleware CORS
	router.Use(func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			w.Header().Set("Access-Control-Allow-Origin", "*")
			w.Header().Set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, PATCH, OPTIONS")
			w.Header().Set("Access-Control-Allow-Headers", "Content-Type, Authorization")

			if r.Method == "OPTIONS" {
				w.WriteHeader(http.StatusOK)
				return
			}

			// Logging para desarrollo
			fmt.Printf("Received %s request for %s\n", r.Method, r.URL.Path)
			next.ServeHTTP(w, r)
		})
	})

	router.Route("/db", func(r chi.Router) {
		r.Post("/avgNotasS", handlers.avgNotasSeccion)
		r.Post("/avgEstudiantesC", handlers.avgEstudianteCurso)
		r.Post("/repHorasB", handlers.repHorasbeca)
		r.Post("/latestAct", handlers.latestActivities)
		r.Post("/avgSeccionP", handlers.avgSeccionProfesor)
	})

	fmt.Println("Server running on http://localhost:8080")

	if err := http.ListenAndServe(":8080", router); err != nil {
		log.Fatal("Server error:", err)
	}
}
