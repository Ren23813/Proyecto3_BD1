package db

import (
	"database/sql"
)

var DB *sql.DB

func Init() {
	var err error

	host := "localhost"
	port := "5430"
	user := "admin"
	password := "admin123"
	dbname := "proyecto3"
}
