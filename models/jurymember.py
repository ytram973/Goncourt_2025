from dataclasses import dataclass
from typing import Optional

@dataclass
class JuryMember:
    id_jury_member: int
    first_name: str
    last_name: str
    login: str
    is_president: bool = False
    password: Optional[str] = None
