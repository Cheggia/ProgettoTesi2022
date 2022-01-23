control "Credenziali" do                        
  impact 1.0                                
  title "testo le credenziali d'accesso"             
  desc "Viene lanciato il comando bash che consente la connessione al database verificando le credenziali tramite le risposta su stderr e exit_status"
  describe command ('mysql -u user -ppassword') do
    #its('stdout') {should eq ""}
    its('stderr') {should_not include "Access denied"}
    its('exit_status') {should cmp 0}
    its('exit_status') {should be >= 0}
    its('exit_status') {should be <= 19}
  end
end  

control "Porta e socket" do                        
  impact 0.5                                
  title "configurazione porta e socket del database"             
  desc "Viene lanciato il comando bash che consente di ricavare le informazioni su porta e socket accedendo al file di configurazione del database"
  describe command ('mysqld --verbose --help | grep -w port | awk \'{ print $2 }\' ') do
    its('stdout') {should include "3306"}
  end
  describe command ('mysqld --verbose --help | grep -w socket | awk \'{ print $2 }\' ') do
    its('stdout') {should include "/var/run/mysqld/mysqld.sock"}
  end
end

control "Servizio mysql" do                        
  impact 0.8                                
  title "Stato running del servizio mysql"             
  desc "Viene lanciato il comando bash che consente di controllare lo stato del servizio mysql all'interno del container. [+] indica lo stato running"
  describe command ('service --status-all') do
    its('stdout') {should include "[ + ]  mysql"}
  end
end

