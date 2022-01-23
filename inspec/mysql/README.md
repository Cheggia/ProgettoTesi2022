# setting_corretto_con InSpec Profile

$ inspec exec /home/marco/Scrivania/tesi/inspec/mysql -t docker://mysql

Questo controllo va lanciato dentro al container mysql. I comandi simulati dal test verranno eseguiti come se l'operatore stesse scrivendo sulla bash del db. I comandi inseriti sono quelli per: accedere con nome utente e password, controllare tra le impostazioni il numero della porta di comunicazione e la cartella contenente le socket, verificare lo stato running del servizio mysql 
