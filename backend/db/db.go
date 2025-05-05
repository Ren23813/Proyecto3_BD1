package db

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq"
)

var DB *sql.DB

func Init() {
	var err error

	host := "localhost"
	port := 5430
	user := "lector_proyecto3"
	password := "mucha_chamba"
	dbname := "Proyecto3"

	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)

	DB, err = sql.Open("postgres", psqlInfo)
	if err != nil {
		log.Fatalf("Error abriendo la conexión: %v", err)
	}
	err = DB.Ping()
	if err != nil {
		log.Fatalf("No se pudo conectar: %v", err)
	}
	log.Println("Conexión exitosa a PostgreSQL")
}
