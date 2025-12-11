# Définir/Mettre à jour la 2e Sélection

**Acteur Principal :** Président du Jury

## Conditions préalables

- Utilisateur a confirmé le rôle de président au lancement (`is_president = True`)
- Une DEUXIÈME sélection existe dans la base de donné 
- Des livres sont déjà présents dans la table `g_book`

## Scénario Principal

1. Le président lance l'application et confirme son statut
2. Sélectionne l'option 6 du menu – Ajouter des livres à la sélection 2
3. Le système utilise la liste prédéfinie des identifiants de livres (`book_ids2`)
4. La couche métier appelle `add_books_to_selection(2025, "SECOND", book_ids2)`
5. SelectionDao effectue :
    - Récupère `id_selection` pour 2025/SECOND
    - Insère les paires `(id_book, id_selection)` dans `g_book_selection` avec `INSERT IGNORE` pour éviter les doublons
6. Le système affiche un message de confirmation avec les livres affectés

## Conditions ultérieures

- La table `g_book_selection` contient les livres sélectionnés pour la 2e sélection

## Variantes/Erreurs

- Les utilisateurs non-présidents ne peuvent pas accéder à cette option de menu

