FROM golang:1.22.0-alpine as builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /lushcafeteria

EXPOSE 8080 

CMD ["/lushcafeteria"]
