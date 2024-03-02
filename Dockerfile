FROM python:3.8

ENV PYTHONUNBUFFERED 1

# Create and set the working directory
WORKDIR /workdir

# Copy only the requirements file to optimize Docker caching
COPY requirements.txt /workdir/

# Install dependencies
RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"
RUN pip install --upgrade pip wheel
RUN pip install -r requirements.txt

# Copy the entire application code to the container
COPY . /workdir/

# Set the Flask app environment variable
ENV FLASK_APP=hello.py

# Expose the port
EXPOSE 5000

# Command to run the application
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
