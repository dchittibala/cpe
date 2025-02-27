from fastapi import FastAPI, Request, HTTPException
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
import requests
from typing import Optional

# Create FastAPI instance
app = FastAPI(title="Cat Gif Generator", description="A simple API that returns random cat gifs")

# Set up Jinja2 templates
templates = Jinja2Templates(directory="templates")


def get_cat_image():
    response = requests.get('https://api.thecatapi.com/v1/images/search?mime_types=gif')
    data = response.json()
    return data[0]['url']

@app.get("/", response_class=HTMLResponse)
async def root(request: Request):
    """
    Get a complete HTML page with a random cat gif
    """
    try:
        cat_gif_url = get_cat_image()
        return templates.TemplateResponse(
            "index.html",
            {"request": request, "cat_gif_url": cat_gif_url}
        )
    except Exception as e:
        raise HTTPException(status_code=500, detail="Failed to fetch cat gif")


# For running with uvicorn directly from this file
if __name__ == "__main__":
    import uvicorn
    uvicorn.run("app:app", host="0.0.0.0", port=5000, reload=True)

