# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the requirements.txt file into the container
COPY requirements.txt ./

# Install any necessary dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Define the command to run your application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

