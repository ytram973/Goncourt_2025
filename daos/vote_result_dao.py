from typing import List
from .dao import Dao

class VoteResultDao(Dao):

    def set_vote(self, id_book: int, votes: int) -> None:
        """Insère ou met à jour le nombre de votes pour un livre."""
        with self.connection.cursor() as cursor:
            sql = """
                INSERT INTO g_vote_result (id_book, v_votes_count)
                VALUES (%s, %s)
                ON DUPLICATE KEY UPDATE v_votes_count = VALUES(v_votes_count)
            """
            cursor.execute(sql, (id_book, votes))

        self.connection.commit()

    def get_all_results(self) -> List[dict]:
        """Retourne la liste complète des résultats triés."""
        with self.connection.cursor() as cursor:
            sql = """
                SELECT 
                    vr.id_book,
                    vr.v_votes_count,
                    b.b_title,
                    a.a_last_name AS author_last_name,
                    a.a_first_name AS author_first_name
                FROM g_vote_result vr
                JOIN g_book b ON b.id_book = vr.id_book
                JOIN g_author a ON a.id_author = b.id_author
                ORDER BY vr.v_votes_count DESC
            """
            cursor.execute(sql)
            return cursor.fetchall()
