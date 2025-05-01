package handlers

import (
	"encoding/json"
	"net/http"
	"strconv"

	"github.com/go-chi/chi/v5"
)

func createSeries(w http.ResponseWriter, r *http.Request) {
	var newSeries Series
	if err := json.NewDecoder(r.Body).Decode(&newSeries); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// Validación básica
	if newSeries.Title == "" || newSeries.Ranking == 0 {
		http.Error(w, "Title and Ranking are required", http.StatusBadRequest)
		return
	}

	// Insertar en la base de datos
	result, err := db.Exec(
		"INSERT INTO series (ranking, title, status, lws_episodes, t_episodes) VALUES (?, ?, ?, ?, ?)",
		newSeries.Ranking,
		newSeries.Title,
		newSeries.Status,
		newSeries.LwsEpisodes, // Asegúrate de usar el mismo nombre
		newSeries.TEpisodes,
	)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// Obtener el ID generado
	id, _ := result.LastInsertId()
	newSeries.ID = int(id)

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusCreated)
	json.NewEncoder(w).Encode(newSeries)
}

func updateseiers(w http.ResponseWriter, r *http.Request) {

	//conertir id a un it desde el request
	idStr := chi.URLParam(r, "id")

	id, err := strconv.Atoi(idStr)
	if err != nil {
		http.Error(w, "ID inválido", http.StatusBadRequest)
		return
	}
	var s Series
	err = json.NewDecoder(r.Body).Decode(&s)
	if err != nil {
		http.Error(w, "JSON inválido", http.StatusBadRequest)
		return
	}

	s.ID = id
	//actualizar registro de bd
	updated, err := db.Exec("UPDATE series SET ranking = ?, title = ?, status = ?, lws_episodes = ?, t_episodes = ?  WHERE id = ?", s.Ranking, s.Title, s.Status, s.LwsEpisodes, s.TEpisodes, s.ID)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// Verificar cuántas filas fueron afectadas
	rowsAffected, _ := updated.RowsAffected()
	if rowsAffected == 0 {
		http.Error(w, "Serie no encontrada", http.StatusNotFound)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(s)

}
