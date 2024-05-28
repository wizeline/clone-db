package db

import (
	"database/sql"
	"fmt"

	"github.com/wizeline/clone-db/config"

	"github.com/golang-migrate/migrate/v4"
	"github.com/golang-migrate/migrate/v4/database/postgres"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	_ "github.com/lib/pq"
)

// DBConn represents a database connection
type DBConn struct {
	client *sql.DB
}

// ConnectDB connects to the PostgreSQL database
func Init(config config.DBConfig) (*DBConn, error) {

	dsn := fmt.Sprintf("postgres://%s:%s@%s:%s/%s?sslmode=disable",
		config.User, config.Pass, config.Host, config.Port, config.Name)

	fmt.Println(dsn)

	// Open database connection
	db, err := sql.Open("postgres", dsn)
	if err != nil {
		return nil, err
	}

	// Ping the database to verify connection
	err = db.Ping()
	if err != nil {
		return nil, err
	}

	return &DBConn{client: db}, nil
}

// Close closes the database connection
func (db *DBConn) Close() error {
	return db.client.Close()
}

// MigrateDB runs PostgreSQL migrations
func (db *DBConn) MigrateDB() error {
	driver, err := postgres.WithInstance(db.client, &postgres.Config{})
	if err != nil {
		return err
	}

	// Create a new migrate instance
	m, err := migrate.NewWithDatabaseInstance(
		"file:///app/migrations/",
		"postgres", driver)
	if err != nil {
		return err
	}

	// Run the migrations
	err = m.Up()
	if err != nil && err != migrate.ErrNoChange {
		return err
	}

	return nil
}
