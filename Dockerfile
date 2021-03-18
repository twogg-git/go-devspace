FROM golang:1.14.1-alpine as build
WORKDIR /app
ADD . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o main .
CMD ["go", "run", "main.go"]


FROM gcr.io/distroless/base-debian10 as production
COPY --from=build /app/main /
EXPOSE 8080
CMD ["/main"]
