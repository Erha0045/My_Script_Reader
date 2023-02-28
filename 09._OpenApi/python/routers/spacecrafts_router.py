from typing import Union
from fastapi import APIRouter, Query
from pydantic import BaseModel

router = APIRouter()

class Spacecraft(BaseModel):
    id: int
    name: str

spacecrafts = [
    {"id": 1, "name": "Voyager 1"},
    {"id": 2, "name": "Voyager 2"},
    {"id": 3, "name": "Cassini"},
    {"id": 4, "name": "Pioneer 10"},
    {"id": 5, "name": "Pioneer 11"},
]

@router.get("/api/spacecrafts", tags=["spacecrafts"], response_model=list[Spacecraft])
def get_spacecrafts():
    return spacecrafts


@router.get("/spacecrafts/{spacecraft_id}")
async def get_spacecraft(spacecraft_id: int, q: Union[str, None] = Query("Default", 
max_length=50)):
    for spacecraft in spacecrafts:
        if spacecraft["id"] == spacecraft_id:
            if show_id != "Default":
                return {"name": spacecraft["name"]}
            return spacecraft
        

        

@router.post("/spacecrafts")
def add_spacecraft(spacecraft: Spacecraft):
    print(spacecraft)
    spacecrafts.append(spacecraft)
    return spacecrafts
