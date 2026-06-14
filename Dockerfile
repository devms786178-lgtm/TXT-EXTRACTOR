FROM python:3.12-slim

# Install system packages
RUN apt update && \
    apt install -y git curl ffmpeg aria2 && \
    apt clean

# Set working directory
WORKDIR /app

# Copy all repo files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt

# Start bot
CMD ["bash", "start.sh"]
