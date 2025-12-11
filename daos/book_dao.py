from typing import List
from .dao import Dao
from models.book import Book


class BookDao(Dao):
    def read_all(self) -> List[Book]:
        with self.connection.cursor() as cursor:
            sql = """
                SELECT 
                    id_book,
                    b_title,
                    b_summary,
                    b_publication_date,
                    b_page_count,
                    b_main_character,
                    b_isbn,
                    b_price,
                    a_first_name AS author_first_name,
                    a_last_name AS author_last_name,
                    p_name      AS publisher_name
                FROM g_book b
                JOIN g_author a    ON b.id_author = a.id_author
                JOIN g_publisher p ON b.id_publisher = p.id_publisher
                ORDER BY b.id_book
            """
            cursor.execute(sql)
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
