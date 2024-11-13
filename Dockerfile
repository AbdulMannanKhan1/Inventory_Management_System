# Use an official Python image as a base
FROM python:3.10-slim

# Set the working directory to /app
WORKDIR /app

# Upgrade pip and install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip --default-timeout=600 install -r requirements.txt

# Copy the project code, excluding unnecessary files
COPY . .

# Expose the port
EXPOSE 8000

# Run the command to start the development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]