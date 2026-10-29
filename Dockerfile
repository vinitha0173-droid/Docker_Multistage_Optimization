# Stage 1: Build dependencies
FROM python:3.12-alpine AS builder

WORKDIR /app
COPY requirements.txt .
RUN mkdir -p /install \
    && pip install --no-cache-dir --prefix=/install -r requirements.txt

# Stage 2: Lightweight runtime
FROM python:3.12-alpine AS runtime

WORKDIR /app

RUN adduser -D appuser

COPY --from=builder /install /usr/local
COPY app.py .

ENV PORT=8000
EXPOSE 8000

USER appuser

CMD ["python", "app.py"]
