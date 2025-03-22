
FROM golang:1.21-alpine

RUN mkdir app
WORKDIR /app

COPY . .

RUN go mod tidy
RUN go build -o main .

CMD ["./main"]
