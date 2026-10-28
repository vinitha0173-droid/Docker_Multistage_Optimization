# Stage 1: Install dependencies
FROM python:3.12-slim AS builder

WORKDIR /app
COPY requirements.txt .
RUN mkdir -p /install && pip install --no-cache-dir --prefix=/install -r requirements.txt

# Stage 2: Create the runtime image
FROM python:3.12-slim AS runtime

WORKDIR /app

RUN useradd --create-home appuser

COPY --from=builder /install /usr/local
COPY app.py .

ENV PORT=8000
EXPOSE 8000

USER appuser

CMD ["python", "app.py"]
