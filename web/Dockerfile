FROM golang:latest AS builder
WORKDIR /app
# D'abord copier UNIQUEMENT le code source (change souvent)
COPY dispatcher.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -o dispatcher dispatcher.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/dispatcher .
# Copier les ressources statiques si nécessaires
COPY static ./static
CMD ["./dispatcher"]