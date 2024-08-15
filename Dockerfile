# Set environment path to include virtual environment binaries
ENV PATH="/opt/venv/bin:$PATH"

# Copy the project files into the container
COPY . /app/.

# Create a virtual environment, activate it, and install dependencies
RUN --mount=type=cache,id=s/509af92e-b487-4b0e-b572-b636ff39029f-/root/cache/pip,target=/root/.cache/pip \
    python -m venv --copies /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install -r requirements.txt
