# Controlli tramite Inspec

client e mysql non contengono nulla per ora

localhost ha tre sottocartelle per controllare alcuni aspetti legati ai container creati nella rete
per eseguire il controllo comando:

inspec exec path/sotto/cartella/localhost


server ha una sola sottocartella (porte) con un solo controllo sulla porta 5000 del container del server
per eseguire il controllo comando

inspec exec path/server/porte -t docker://container_server-0

lo stesso controllo sul server può essere eseguito sui client cambiando la porta in ascolto (5001 e 5002).

ho provato a ripetere il controllo della porta anche sul container mysql ma la porta 3306 non sembra mai in ascolto.
ho provato anche il controllo per vedere se il servizio mysql e/o mysqld fossero attivi sul container ma con esito sempre negativo. 
non capisco se il problema sia legato al forwarding di docker o da altri problemi
