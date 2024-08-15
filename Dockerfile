# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variable for Python to not buffer outputs (useful for logging)
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Copy requirements.txt into the container at /app
COPY requirements.txt /app/

# Create a virtual environment and install dependencies
RUN python -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Ensure the virtual environment binaries are in the PATH
ENV PATH="/opt/venv/bin:$PATH"

# Copy the rest of the application code into the container
COPY . /app/

# Command to run your bot
CMD ["python", "bot.py"]
