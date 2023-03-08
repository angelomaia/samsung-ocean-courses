Drop TABLE pokemon;
DROP Table Treinadores

CREATE TABLE Treinadores(
  codigo SERIAL PRIMARY KEY,
  nome VARCHAR(15),
  cidade VARCHAR(15),
  insignias SMALLINT
);

create TABLE Pokemon(
  codigo SERIAL PRIMARY KEY,
  nome VARCHAR(15),
  tipo VARCHAR(15),
  nivel SMALLINT,
  capturado_em TIMESTAMPTZ,
  codigo_treinador INTEGER NOT NULL REFERENCES Treinadores(codigo)
);



ALTER TABLE Pokemon ALTER capturado_em TYPE TIMESTAMPTZ;

ALTER TABLE Pokemon ADD COLUMN treinador VARCHAR(20);

ALTER TABLE pokemon DROP COLUMN cidade;

ALTER TABLE Pokemon DROP COLUMN insignias;


INSERT INTO Pokemon(codigo_treinador, nome, tipo, nivel, capturado_em) VALUES
(1, 'Pikachu', 'Eletrico', 7, '2023-03-06 21:15:00.000 -03'),
(1, 'Pikachu', 'Eletrico', 10, '2023-03-07 21:15:00.000 -03'),
(2, 'Charmander', 'Fogo', 9, '2023-03-07 21:15:00.000 -03'),
(2, 'Charizard', 'Fogo', 40, '2023-03-07 21:15:00.000 -03'),
(2, 'Oddish', 'Grama', 3, '2023-02-07 21:15:00.000 -03'),
(1, 'Bulbassauro', 'Grama', 5, '2023-03-06 18:15:00.000 -03');

INSERT INTO treinadores(nome, cidade, insignias) VALUES
('Ash', 'Pallet', 2),
('Feulo', 'SP', 4),
('Brock', 'Pewter', 1);

INSERT INTO Pokemon(codigo_treinador, nome, tipo, nivel, capturado_em) VALUES
(4, 'Mewtwo', 'Psiquico', 99, '2023-03-06 18:15:00.000 -03');

DELETE FROM Pokemon;
UPDATE Pokemon SET nivel=15 Where nome="Pikachu"; 

SELECT * FROM Pokemon
SELECT * FROM Treinadores

SELECT treinador, nome, nivel
FROM Pokemon
ORDER BY treinador ASC, nivel DESC

UPDATE Pokemon SET cidade='Pallet' WHERE treinador='Ash';

SELECT nome FROM treinadores
ORDER BY insignias DESC
LIMIT 1


SELECT nome, tipo FROM pokemon
WHERE treinador=(
  		SELECT nome FROM treinadores
	   	ORDER BY insignias DESC
		LIMIT 1
       ) AND tipo= 'Grama'
ORDER BY nivel DESC
LIMIT 2

SELECT treinadores.nome, AVG(nivel) as media
FROM Pokemon JOIN treinadores ON pokemon.codigo_treinador=treinadores.codigo
GROUP BY (treinadores.codigo)
ORDER BY media DESC 
