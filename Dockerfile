# Use a newer Python version if necessary
FROM python:3.10-slim

# Set environment variable to avoid buffering (useful for logs)
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy only requirements.txt first to leverage Docker caching
COPY requirements.txt /app/

# Create a virtual environment and install dependencies
RUN python -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Add the virtual environment to the PATH
ENV PATH="/opt/venv/bin:$PATH"

# Copy the rest of the application
COPY . /app/

# Command to run your bot
CMD ["python", "bot.py"]
