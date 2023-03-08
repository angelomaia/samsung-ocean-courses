from sqlalchemy import create_engine
from sqlalchemy.sql import text

# Cria a engine para o banco de dados

if environment == "PROD":
    eng = create_engine("postgresql://esyslokz:RJjtyfSp-yV-3RfvP1yTLyXyDeLMC7_p@kesavan.db.elephantsql.com/esyslokz")
else:
    eng = create_engine("sqlite:///pokemon.db")

print(eng)

# Abre uma conexao com o banco e executa codigo SQL

#with eng.connect() as con:
#    con.execute(text("DROP TABLE treinadores"))