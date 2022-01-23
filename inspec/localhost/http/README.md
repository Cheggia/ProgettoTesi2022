# setting_corretto_con InSpec Profile

$ inspec exec /home/marco/Scrivania/tesi/inspec/localhost/http

Questo controllo va lanciato in localhost e verifica che localhost possa connettersi tramite http alle porte dei container.
Viene verificato anche parte del contenuto della pagina raggiunta.

Il controllo viene effettuato due volte, una come localhost, una con gli indirizzi IP dei container.
Il controllo è di tipo puramente accademico per mostrare la mappatura delle porte effettuata da docker

