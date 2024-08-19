from sqlalchemy import create_engine, text
from faker import Faker

def get_db_engine():
    return create_engine('postgresql://postgres:postgres@localhost:5432/pokemon')

while True:
    try:
        db_engine = get_db_engine().connect()
        if(db_engine):
            break
    except Exception as e:
        print(e)

faker = Faker('en_US')

for i in range(10):
    print(f"Inserting record number {i + 1}")
    Chance_Captura = faker.random_int(min=0, max=100)
    Pokeball_TIPO = faker.random_int(min=1, max=10)
    ID_Pokebola = faker.random_int(min=0, max=10000)
    insert = f"INSERT INTO Pokeball (ID_Pokebola,Chance_Captura,Pokeball_TIPO) VALUES ({ID_Pokebola},{Chance_Captura}, {Pokeball_TIPO})"
    db_engine.execute(text(insert).execution_options(autocommit=True))
    print(f"Complete record number {i + 1}")

db_engine.close()