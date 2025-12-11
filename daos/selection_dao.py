# daos/selection_dao.py
from typing import List
from .dao import Dao
from models.book import Book

class SelectionDao(Dao):
    def find_books_by_year_and_type(self, year: int, sel_type: str) -> List[Book]:
        with self.connection.cursor() as cursor:
            sql = """
                SELECT 
                    b.id_book,
                    b.b_title,
                    b.b_summary,
                    b.b_publication_date,
                    b.b_page_count,
                    b.b_main_character,
                    b.b_isbn,
                    b.b_price,
                    a.a_first_name AS author_first_name,
                    a.a_last_name AS author_last_name,
                    p.p_name      AS publisher_name
                FROM g_book b
                JOIN g_author a        ON b.id_author = a.id_author
                JOIN g_publisher p     ON b.id_publisher = p.id_publisher
                JOIN g_book_selection bs ON bs.id_book = b.id_book
                JOIN g_selection s       ON s.id_selection = bs.id_selection
                WHERE s.s_year = %s
                  AND s.s_type  = %s
                ORDER BY b.id_book
            """
            cursor.execute(sql, (year, sel_type))
            rows = cursor.fetchall()

        return [
            Book(
                id_book=row["id_book"],
                title=row["b_title"],
                summary=row["b_summary"],
                publication_date=row["b_publication_date"],
                page_count=row["b_page_count"],
                main_character=row["b_main_character"],
                isbn=row["b_isbn"],
                price=float(row["b_price"]) if row["b_price"] is not None else None,
                author_first_name=row["author_first_name"],
                author_last_name=row["author_last_name"],
                publisher_name=row["publisher_name"],
            )
            for row in rows
        ]

    def _get_selection_id(self, year: int, sel_type: str) -> int:
        """Retourne l'id_selection existant pour (year, type)."""
        with self.connection.cursor() as cursor:
            cursor.execute(
                "SELECT id_selection FROM g_selection WHERE s_year = %s AND s_type = %s",
                (year, sel_type),
            )
            row = cursor.fetchone()

        if not row:
            raise ValueError(f"Aucune sélection trouvée pour {year} / {sel_type}")
        return row["id_selection"]
    
    def add_books_to_selection(self, year: int, sel_type: str, book_ids: List[int]) -> None:
        """
        Ajoute des livres à une sélection EXISTANTE sans supprimer les anciens.
        year  : ex. 2025
        sel_type : 'SECOND', 'THIRD', etc.
        """
        id_selection = self._get_selection_id(year, sel_type)

        with self.connection.cursor() as cursor:
            for bid in book_ids:
                cursor.execute(
                    """
                    INSERT IGNORE INTO g_book_selection (id_book, id_selection)
                    VALUES (%s, %s)
                    """,
                    (bid, id_selection),
                )
        self.connection.commit()  
          
    def del_books_to_selection(self, year: int, sel_type: str, book_ids: List[int]) -> None:
        """
        Supprime des livres d'une sélection EXISTANTE.
        year  : ex. 2025
        sel_type : 'SECOND', 'THIRD', etc.
        """
        id_selection = self._get_selection_id(year, sel_type)

        with self.connection.cursor() as cursor:
            for bid in book_ids:
                cursor.execute(
                """
                DELETE FROM g_book_selection
                WHERE id_book = %s AND id_selection = %s
                """,
                (bid, id_selection),
            )

        self.connection.commit()
    