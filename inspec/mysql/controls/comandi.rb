control "Comando per connessione" do                        
  impact 1.0                                
  title "Comando per connessione al db tramite bash di container_mysql-0_1"             
  desc "Testo il comando che mi consente la connessione al database tramite bash.
        Inspec controlla l'esito dei comandi come se avessi un terminale aperto sulla macchina contenente il database mysql."
  describe command ('mysql -u user -ppassword') do
    its('stdout') {should eq ""}
    its('stderr') {should_not include "Access denied"}
    its('exit_status') {should cmp 0}
    its('exit_status') {should be >= 0}
    its('exit_status') {should be <= 19}
  end
end  

control "Comandi per controllo porta e socket" do                        
  impact 0.5                                
  title "Comandi per controlli vari sulla bash di container_mysql-0_1"             
  desc "Testo i comandi che mi consentono di verificare porta in ascolto e path delle socket del db.
        Inspec controlla l'esito dei comandi come se avessi un terminale aperto sulla macchina contenente il database mysql."
  describe command ('mysqld --verbose --help | grep -w port | awk \'{ print $2 }\' ') do
    its('stdout') {should include "3306"}
  end
  describe command ('mysqld --verbose --help | grep -w socket | awk \'{ print $2 }\' ') do
    its('stdout') {should include "/var/run/mysqld/mysqld.sock"}
  end
end

control "Comando per controllo servizio mysql" do                        
  impact 0.8                                
  title "Comando per controllo stato running del container_mysql-0_1"             
  desc "Testo il comando che mi consente di verificare se il servizio mysql è attivo e running.
        Inspec controlla l'esito dei comandi come se avessi un terminale aperto sulla macchina contenente il database mysql."
  describe command ('service --status-all') do
    its('stdout') {should include "[ + ]  mysql"}
  end
end

