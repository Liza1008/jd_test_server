FROM golang:1.24-alpine

WORKDIR /app

COPY . .

EXPOSE 8080

CMD ["go", "run", "cmd/main.go"]