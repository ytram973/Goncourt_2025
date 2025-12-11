from daos.book_dao import BookDao
from daos.selection_dao import SelectionDao
from daos.jury_member_dao import JuryMemberDao
from daos.vote_result_dao import VoteResultDao


class GoncourtMetier:
    def __init__(self) -> None:
        """Initialise les DAO nécessaires pour les opérations métier."""
        self.book_dao = BookDao()
        self.selection_dao = SelectionDao()
        self.jury_member_dao = JuryMemberDao()
        self.vote_dao = VoteResultDao()

        
    def list_all_books(self):
        """Retourne tous les livres."""
        return self.book_dao.read_all()

    def list_jury_members(self):
        """Retourne tous les membres du jury."""
        return self.jury_member_dao.read_all()
    
    
    def list_selection(self, year: int, sel_type: str):
        """Retourne les livres d'une sélection donnée pour une année donnée."""
        return self.selection_dao.find_books_by_year_and_type(year, sel_type)

    def add_books_to_selection(self, year: int, sel_type: str, book_ids: list[int]) -> None:
        """Ajoute des livres à une sélection donnée pour une année donnée."""
        self.selection_dao.add_books_to_selection(year, sel_type, book_ids)
        
    def del_books_to_selection(self, year: int, sel_type: str, book_ids: list[int]) -> None:
        """Supprime des livres d'une sélection donnée pour une année donnée."""
        self.selection_dao.del_books_to_selection(year, sel_type, book_ids)
    
    def set_vote_for_book(self, id_book: int, votes: int) -> None:
        """Enregistre le nombre de votes pour un livre."""
        self.vote_dao.set_vote(id_book, votes)

    def list_vote_results(self):
        """Retourne tous les résultats de vote triés."""
        return self.vote_dao.get_all_results()


