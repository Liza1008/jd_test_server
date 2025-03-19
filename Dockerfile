FROM golang:1.24-alpine

WORKDIR /app

COPY . .

CMD ["go", "run", "cmd/main.go"]
