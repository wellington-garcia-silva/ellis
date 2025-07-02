FROM python:3.13.4-alpine3.22

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
# Note: Based on your readme.md, this file should be named 'requirements.txt'
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
# --no-cache-dir reduces image size and --upgrade pip is a good practice
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application's code to the working directory
COPY . .

# Expose port 8000 to the outside world, which is the default for uvicorn
EXPOSE 8000

# Command to run the application
# Use 0.0.0.0 to make it accessible from outside the container.
# The --reload flag from your readme.md is for development and should not be used in production.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000",  "--reload"]




