# Use a lightweight Python image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy app files
COPY app.py .
COPY smiley.gif .

# Install Flask
RUN pip install Flask

# Expose port 5000
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]