# Dockerfile

# Step 1: Build the Go application
FROM golang:1.22.3-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod tidy

COPY . .

RUN go build -o /goapp main.go

# Step 2: Create a lightweight image for running the Go application
FROM alpine:latest

WORKDIR /root/

COPY --from=builder /goapp .

CMD ["./goapp"]