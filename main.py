from business.goncourt_metier import GoncourtMetier

YEAR = 2025


def show_books(books):
    """Affiche une liste de livres."""
    if not books:
        print("Aucun livre trouvé.")
        return
    for b in books:
        print(f" \t id=[{b.id_book}] {b.title} - {b.author_first_name} {b.author_last_name} ({b.publisher_name})")

def show_jury(jury):
    """Affiche une liste des membres du jury."""
    if not jury:
        print("Aucun livre trouvé.")
        return
    for j in jury:
        print(f" \t{j.first_name} - {j.is_president} ")
        
def ask_if_president() -> bool:
    """Demande si l'utilisateur est le président du jury."""
    while True:
        answer = input("Êtes-vous le président du jury ? (o/n) : ").strip().lower()
        if answer in ("o", "oui"):
            return True
        if answer in ("n", "non"):
            return False
        print("Répondez par 'o' ou 'n'.")
        
def show_results(results):
    """Affiche les résultats des votes."""
    if not results:
        print("Aucun vote enregistré.")
        return
    print("\n=== Résultats des votes ===")
    rang = 1
    for row in results:
        print(f"{rang}. {row['b_title']} - {row['author_first_name']} {row['author_last_name']} : {row['v_votes_count']} voix")
        rang += 1        
        
# Listes des IDs des livres pour les sélections 2 et 3
book_ids2 = [1, 2, 3, 6, 10, 7, 11, 15]

book_ids3 = [1, 2, 3, 7]

def main():
    # Initialisation du couche métier
    service = GoncourtMetier()
    # Vérification si l'utilisateur est le président du jury
    is_president = ask_if_president()

    # Boucle principale du menu
    while True:
        print("\n=== Prix Goncourt 2025 ===")
        print("1. Afficher la 1ère sélection")
        print("2. Afficher la 2ème sélection")
        print("3. Afficher la 3ème sélection")
        print("4. Afficher tous les livres")
        print("5. Afficher tous les jury membres")
        
        # Options réservées au président du jury
        if is_president:
            print("6. Ajoute les livres de la sélection 2")
            print("7. Delete des livres de la sélection 2")
            print("8. Ajoute les livres de la sélection 3")
            print("9. Delete des livres de la sélection 3")
            print("9. Delete des livres de la sélection 3")
            print("10. Saisir les votes pour un livre finaliste")
            
        print("11. Afficher les résultas final")
        print("0. Quitter")

        choice = input("Votre choix : ").strip()

        if choice == "1":
            books = service.list_selection(YEAR, "FIRST")
            show_books(books)

        elif choice == "2":
            books = service.list_selection(YEAR, "SECOND")
            show_books(books)

        elif choice == "3":
            books = service.list_selection(YEAR, "THIRD")
            show_books(books)

        elif choice == "4":
            books = service.list_all_books()
            show_books(books)

        elif choice == "5":
            jury = service.list_jury_members()
            show_jury(jury)

        elif choice in ("6", "7", "8", "9"):
            if not is_president:
                print("Accès refusé : cette action est réservée au président du jury.")
                continue

            if choice == "6":
                service.add_books_to_selection(YEAR, "SECOND", book_ids2)
                print("Sélection 2 mise à jour avec les livres :", book_ids2)

            elif choice == "7":
                service.del_books_to_selection(YEAR, "SECOND", book_ids2)
                print("Sélection 2 : suppression des livres :", book_ids2)

            elif choice == "8":
                service.add_books_to_selection(YEAR, "THIRD", book_ids3)
                print("Sélection 3 mise à jour avec les livres :", book_ids3)

            elif choice == "9":
                service.del_books_to_selection(YEAR, "THIRD", book_ids3)
                print("Sélection 3 : suppression des livres :", book_ids3)
                
        elif choice == "10" and is_president:
            print("\n=== Finalistes (3ème sélection) ===")
            finalists = service.list_selection(YEAR, "THIRD")
            show_books(finalists)

            try:
                id_book = int(input("Id du livre à voter : ").strip())
                votes = int(input("Nombre de voix : ").strip())
            except ValueError:
                print("Entrée invalide, utilisez des nombres.")
                continue

            service.set_vote_for_book(id_book, votes)
            print(f"Vote enregistré : livre {id_book} -> {votes} voix.")
            
        elif choice == "11":
            results = service.list_vote_results()
            show_results(results)
            
        elif choice == "0":
            break

        else:
            print("Choix invalide.")


if __name__ == "__main__":
    print("L'Application - Affichera des informations du Prix Goncourt 2025")
    main()