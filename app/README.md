# GIF Generator

This is a simple FastAPI application that generates random GIFs.

## Prerequisites

- uv
- Python 3.12 or later

## Installation

1. Install the required dependencies:

```
uv sync
```

## Running the Application

### Local Environment

To run the application locally using `uv`, follow these steps:

1. Set the `ENV` environment variable to `'local'`:

   - On Unix-based systems (Linux, macOS):
     ```
     export ENV=local
     ```

   - On Windows:
     ```
     set ENV=local
     ```

2. Start the `uv` server:

```
uv run app.py
```

This command will start the `uvicorn` server and automatically reload it when you make changes to the code files.

3. Access the application in your web browser at `http://localhost:8000`.

### Production or Development Environment

To run the application in a production or development environment using `uv`, follow these steps:

1. Set the `ENV` environment variable to the desired value (e.g., `'prod'` or `'dev'`):

   - On Unix-based systems (Linux, macOS):
     ```
     export ENV=prod
     ```

   - On Windows:
     ```
     set ENV=prod
     ```

2. Set the `BUCKET_NAME` environment variable to the name of your S3 bucket containing the GIF files:

   - On Unix-based systems (Linux, macOS):
     ```
     export BUCKET_NAME=your-bucket-name
     ```

   - On Windows:
     ```
     set BUCKET_NAME=your-bucket-name
     ```

3. Start the `uv` server:

```
uv run app.py
```

This command will start the `uv` server without the `--reload` option, which is recommended for production environments.

4. Access the application using the appropriate URL or IP address.

Note: In a production environment, you would typically use a more robust ASGI server like Gunicorn or `uv` behind a reverse proxy like Nginx.

## Configuration

Make sure you have the necessary AWS credentials configured on your machine or in your deployment environment for `boto3` to access the S3 bucket when running in production or development mode.