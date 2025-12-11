from typing import List
from .dao import Dao
from models.jurymember import JuryMember


class JuryMemberDao(Dao):
    def read_all(self) -> List[JuryMember]:
        with self.connection.cursor() as cursor:
            sql = """
                SELECT 
                    id_jury_member,
                    j_first_name,
                    j_last_name,
                    j_login,
                    j_is_president
                FROM g_jury_member
                ORDER BY id_jury_member
            """
            cursor.execute(sql)
            rows = cursor.fetchall()

        return [
            JuryMember(
                id_jury_member=row["id_jury_member"],
                first_name=row["j_first_name"],
                last_name=row["j_last_name"],
                login=row["j_login"],
                is_president=bool(row["j_is_president"]),
            )
            for row in rows
        ]


