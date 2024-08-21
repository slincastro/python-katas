from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware

app = FastAPI()

# Configura CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Permite todas las origenes
    allow_credentials=True,
    allow_methods=["*"],  # Permite todos los métodos
    allow_headers=["*"],  # Permite todos los headers
)

@app.get("/hello")
async def hello():
    return {"message": "Hello World"}
