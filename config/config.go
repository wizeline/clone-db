package config

import (
	"fmt"

	"github.com/spf13/viper"
)

const (
	envDBHost = "DB_HOST"
	envDBPort = "DB_PORT"
	envDBName = "DB_NAME"
	envDBUser = "DB_USER"
	envDBPass = "DB_PASS"
)

// DBConfig holds the database configuration
type DBConfig struct {
	Host string
	Port string
	Name string
	User string
	Pass string
}

// LoadDBConfig loads the database configuration using Viper
func LoadDBConfig() (*DBConfig, error) {
	viper.AutomaticEnv()

	requiredEnvVars := []string{envDBHost, envDBPort, envDBName, envDBUser, envDBPass}

	for _, key := range requiredEnvVars {
		if !viper.IsSet(key) {
			return nil, fmt.Errorf("environment variable %s is required but not set", key)
		}
	}

	dbConfig := &DBConfig{
		Host: viper.GetString(envDBHost),
		Port: viper.GetString(envDBPort),
		Name: viper.GetString(envDBName),
		User: viper.GetString(envDBUser),
		Pass: viper.GetString(envDBPass),
	}

	return dbConfig, nil
}
