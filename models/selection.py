from dataclasses import dataclass
from datetime import date
from typing import Optional

@dataclass
class Selection:
    id_selection: int
    year: int
    type: str
    selection_date: Optional[date]
