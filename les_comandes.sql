
mysqldump -u root -p gameworld > backup.sql





SELECT j.pseudo, s.score
FROM scores s
JOIN joueurs j ON s.id_joueur = j.id
WHERE s.id_session = 12
ORDER BY s.score DESC;


SELECT j.pseudo
FROM joueurs j
LEFT JOIN scores s ON j.id = s.id_joueur
WHERE s.id_joueur IS NULL;

SELECT j.titre, g.nom AS genre
FROM jeux j
JOIN genres g ON j.id_genre = g.id;

SELECT j.pseudo, COUNT(DISTINCT s.id_session) AS total_sessions
FROM joueurs j
JOIN scores s ON j.id = s.id_joueur
GROUP BY j.id, j.pseudo
ORDER BY total_sessions DESC;

SELECT j.pseudo AS Joueur, ROUND(AVG(s.score), 2) AS Score_moyen
FROM joueurs AS j
JOIN scores AS s
ON j.id = s.id_joueur
GROUP BY j.id, j.pseudo
ORDER BY Score_moyen DESC;

SELECT j.pseudo AS Joueur, se.date_session AS Date, je.titre AS Jeu, sc.score AS Score
FROM scores AS sc
JOIN joueurs AS j
ON j.id = sc.id_joueur
JOIN sessions AS se
ON se.id = sc.id_session
JOIN jeux AS je
ON je.id = se.id_jeu
WHERE sc.score > 1400
ORDER BY sc.score DESC;

SELECT e.nom AS Equipe, j.pseudo AS Joueur, j.pays AS Pays
FROM membres_equipes AS me
JOIN equipes AS e
ON e.id = me.id_equipe
JOIN joueurs AS j
ON j.id = me.id_joueur
ORDER BY e.nom, j.pseudo;

SELECT j.titre AS Jeu, COUNT(s.id) AS Nombre_sessions
FROM jeux AS j
JOIN sessions AS s
ON j.id = s.id_jeu
GROUP BY j.id, j.titre
HAVING COUNT(s.id) > 3
ORDER BY Nombre_sessions DESC;

SELECT s.id AS id_session, j.titre AS jeu, s.date_session, COUNT(sc.id_joueur) AS nb_joueurs
FROM sessions s
JOIN jeux j
ON s.id_jeu = j.id
LEFT JOIN scores sc
ON s.id = sc.id_session
GROUP BY s.id, j.titre, s.date_session
ORDER BY s.date_session;

SELECT j.titre AS jeu, ROUND(AVG(sc.score), 2) AS score_moyen
FROM scores sc
JOIN sessions s
ON sc.id_session = s.id
JOIN jeux j
ON s.id_jeu = j.id
GROUP BY j.id, j.titre
ORDER BY score_moyen DESC;

CREATE USER 'analyste'@'localhost' IDENTIFIED BY '1234';

GRANT SELECT ON gameworld.joueurs TO 'analyste'@'localhost';
GRANT SELECT ON gameworld.scores TO 'analyste'@'localhost';
GRANT SELECT ON gameworld.sessions TO 'analyste'@'localhost';

SHOW GRANTS FOR 'analyste'@'localhost';

INSERT INTO joueurs (pseudo) VALUES ('test'); 
SELECT * FROM jeux;               



REVOKE ALL PRIVILEGES ON gameworld.* FROM 'analyste'@'localhost';
DROP USER 'analyste'@'localhost';


CREATE OR REPLACE VIEW vue_scores_moyens AS
SELECT  j.pseudo, AVG(s.score) AS score_moyen
FROM joueurs j JOIN scores s ON j.id = s.id_joueur
GROUP BY j.pseudo;

SELECT * FROM vue_scores_moyens;