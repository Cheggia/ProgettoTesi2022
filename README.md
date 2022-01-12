# RETE E CONTROLLI

                     --------------------------------------------------------
                     | client-0 <--------                                   |
                     |                  |                                   |
         host docker |                  |-------->server-0<-------->mysql-0 |
                     |                  |                                   |
                     | client-1 <--------                                   |
                     --------------------------------------------------------

La rete è composta da due client che interrogqano un server con delle query. 
Il server comunica con mysql, prende i dati e li rispedisce al client che ha fatto la richiesta.
Tramite localhost:5001/form e localhost:5002/form si possono fare le query per verificare il funzionamento.

La cartella container contiene tutto il materiale per creare la rete di container tramite docker-compose

La cartella inspec contiene i vari controlli da fare sulla rete.

Diversi controlli sono previsti per vari parti della rete in modo da mostrare varie opportunità
-i controlli della cartella localhost vanno lanciati nell'host docker
	-controllano docker_container, http, port
-i controlli della cartella server vanno lanciati sul container server-0
	-controllano port
-i controlli della cartella client vanno lanciati sui container client-0 e client-1
	- in questo momento non ha controlli realizzati
-i controlli della cartella mysql vanno lanciati sui container mysql-0
	- controllano command
