# Creazione rete container

docker-compose up -d

vengono creati 2 client (client-0 e client-1) che comunicano con un server (server-0) che a sua volta comunica con un database mysql (mysql-0).

per controllare se client-0, client-1 e sever-0 sono up e funzionanti
localhost:5000/check
localhost:5001/check
localhost:5002/check

per utilizzare client-0 e client-1 per fare richieste
localhost:5001/form
localhost:5002/form
inserire nel campo uno dei nomi: yuna, rikku, paine, lulu
