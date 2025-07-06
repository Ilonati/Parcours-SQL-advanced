# 🕹️ TP SQL — GameWorld Online

## 🎯 Objectif général

Vous êtes en mission chez *GameWorld Online*, une plateforme qui héberge des jeux multijoueurs, des sessions d’e-sport et des profils de joueurs.  
Votre rôle : interroger la base de données existante pour produire des statistiques, manipuler des sauvegardes et sécuriser les accès.

---

## 🗃️ Structure realtionnelle

| Table             | Contenu                                                               |
| ----------------- | --------------------------------------------------------------------- |
| `jeux`            | Les jeux vidéo disponibles                                            |
| `joueurs`         | Les utilisateurs de la plateforme                                     |
| `sessions`        | Parties de jeu enregistrées                                           |
| `scores`          | Scores obtenus lors des sessions                                      |
| `equipes`         | Certaines parties peuvent être jouées en équipe                       |
| `membres_equipes` | Joueurs qui appartiennent à une équipe                                |
| `genres`          | Genre des jeux (pour requêtes multi-tables avec jointures indirectes) |


## 🔧 Phase 1 : Mise en place

1. Exécutez le script `init_gameworld.sql` dans votre instance MySQL.
2. Vérifiez que toutes les tables sont bien créées et que les données sont insérées correctement.
3. Familiarisez-vous avec les entités suivantes :
   - `joueurs`, `jeux`, `sessions`, `scores`, `genres`
   - `equipes`, `membres_equipes`

---

## 🔍 Phase 2 : Requêtes SQL (Jointures et Agrégats)

👉 Répondez aux questions suivantes à l’aide de requêtes SQL. Utilisez les jointures appropriées.

1. Afficher les scores de chaque joueur pour la session 12, triés par score décroissant.
2. Afficher la liste des joueurs n'ayant jamais participé à une session.
3. Lister les titres des jeux avec leur genre.
4. Afficher pour chaque joueur le nombre total de sessions jouées.
5. Donner le score moyen obtenu par chaque joueur, avec leur pseudo.
6. Lister les joueurs ayant obtenu un score supérieur à 1400 au moins une fois, avec la date et le jeu.
7. Afficher les membres de chaque équipe, avec le nom de l'équipe, le pseudo et le pays.
8. Afficher les jeux ayant eu plus de 3 sessions différentes.
9. Donner pour chaque session le jeu joué, la date et le nombre de joueurs présents.
10. Afficher les scores moyens par jeu, triés du plus fort au plus faible.

---

## 💾 Phase 3 : Sauvegardes

Exécutez ces opérations depuis votre terminal ou une interface graphique (phpMyAdmin, DBeaver, etc.).

1. Effectuez une **sauvegarde complète** de la base de données dans un fichier `gameworld_backup.sql`.
2. Supprimez la base de données.
3. Restaurez-la à partir de la sauvegarde et vérifiez que les données sont intactes.
4. _(Bonus)_ Exportez uniquement les tables `joueurs` et `scores` dans un fichier `mini_backup.sql`.

---

## 🛡️ Phase 4 : Rôles et Sécurité

Vous allez créer un accès utilisateur limité pour un analyste externe.

1. Créez un utilisateur SQL `analyste@localhost` avec un mot de passe sécurisé.
2. Donnez-lui les **droits en lecture seule** sur les tables suivantes : `joueurs`, `scores`, `sessions`.
3. Vérifiez qu’il ne peut pas :
   - Modifier ou insérer des données
   - Accéder aux autres tables
4. _(Bonus)_ Révoquez les droits, puis supprimez l'utilisateur proprement.

---

## ✏️ Bonus

- Créez une **vue** `vue_scores_moyens` qui affiche le pseudo des joueurs avec leur score moyen.
- Créez une **procédure stockée** `stats_jeu` qui prend l’ID d’un jeu et renvoie les sessions et scores associés.

---

## 🧠 Compétences mobilisées

- Requêtes multi-tables (jointures)
- Fonctions d’agrégats (`AVG`, `COUNT`, `GROUP BY`, `HAVING`)
- Sauvegarde et restauration avec `mysqldump`
- Gestion des privilèges et utilisateurs SQL

---

## 📁 Fichiers fournis

- `init_gameworld.sql` — Script de création des tables et insertion de données.

## 📸 Dossier de livrables

Pour valider votre travail, créez un dossier `capture/` dans lequel vous placerez les éléments suivants :

- Des **captures d'écran** ou **exports texte** des résultats pour chaque requête de la Phase 2.
- Une **preuve de la sauvegarde complète** (contenu ou capture de la commande `mysqldump`, fichier `.sql`, etc.).
- Une **preuve de la restauration réussie** (extrait de vérification ou capture de la base restaurée).
- Une **preuve que les rôles ont bien été appliqués** :
  - Connexion avec l'utilisateur `analyste`
  - Tentative de lecture autorisée
  - Tentative d’écriture ou d’accès interdit à d'autres tables

Les fichiers peuvent être des `.sql`, `.txt`, `.png`, `.jpg`, ou toute autre extension lisible et cohérente.

> ✅ Ce dossier servira de **preuve de complétion** et sera à rendre avec votre travail final.

# Parkours-SQL-advanced
