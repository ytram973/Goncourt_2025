from dataclasses import dataclass
from datetime import date
from typing import Optional

@dataclass
class Book:
    id_book: int
    title: str
    summary: Optional[str]
    publication_date: Optional[date]
    page_count: Optional[int]
    main_character: Optional[str]
    isbn: Optional[str]
    price: Optional[float]
    author_last_name: str | None = None   
    publisher_name: str | None = None
