FROM golang:1.17.1 as stage

WORKDIR /app

COPY . .

RUN go build main.go

FROM scratch as prod

WORKDIR /app

COPY --from=stage /app/main ./

CMD ["./main"]
