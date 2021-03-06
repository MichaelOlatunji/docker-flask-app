FROM python:3.7.3-stretch

# Working directory
WORKDIR '/app/'

# Copy flask_app to /app
COPY . flask_app/web.py /app/
COPY . nlib /app/

# Install packages from requirements.txt
RUN pip install --upgrade pip && \
    pip install --trusted-host pypi.python.org -r requirements.txt
    
# Expose port 80
EXPOSE 80

# Run app at container launch 
CMD ["python", "web.py"]