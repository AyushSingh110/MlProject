FROM python:3.8-slim-buster

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install only necessary system dependencies (if needed)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port (Render will assign it dynamically)
EXPOSE 5000

# Run your Flask app
CMD ["gunicorn", "application:app", "--bind", "0.0.0.0:5000"]
