package main

import (
	"log"

	"github.com/wizeline/clone-db/config"
	"github.com/wizeline/clone-db/db"
)

func main() {
	// Connect to the database
	dbConfig, err := config.LoadDBConfig()
	if err != nil {
		log.Fatalf("Could not get configurations: %v", err)
	}

	dbClient, err := db.Init(*dbConfig)
	if err != nil {
		log.Fatalf("Could not connect to the database: %v", err)
	}
	defer dbClient.Close()

	// Run migrations
	err = dbClient.MigrateDB()
	if err != nil {
		log.Fatalf("Error applying migrations: %v", err)
	}

	log.Println("Migrations completed successfully!")
}
