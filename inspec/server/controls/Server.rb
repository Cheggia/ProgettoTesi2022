control "Porta" do                        
  impact 0.7                                
  title "Controllo porta 5000 su server-0"             
  desc "Si controlla che la porta 5000 sia in ascolto per connessioni tcp"
  describe port('5000') do
     it {should be_listening}
     its('protocols') {should include 'tcp'}
  end
end

control "Connessione localhost" do                        
  impact 0.7                                
  title "Controlli vari tipo host"             
  desc "Si controlla che l'host sia raggiungibile e che corrisponda l'indirizzo IP deciso in fase di costruzione container"
  describe host('localhost') do
    it { should be_reachable }
    it { should be_resolvable }
    its('connection') { should_not match /connection refused/ }
    its('ipaddress') { should include '127.0.0.1' }
  end
end

control "Connessione mysql" do                        
  impact 0.7                                
  title "Controllo comunicazione con database"             
  desc "Si controlla che l'host sia raggiungibile e che corrisponda l'indirizzo IP deciso in fase di costruzione container"
  describe host('mysql', port:3306, protocol:'tcp') do
    it { should be_reachable }
    it { should be_resolvable }
    its('connection') { should_not match /connection refused/ }
    its('ipaddress') { should include '172.18.0.2' }
  end
end

control "Connessione client-0" do                        
  impact 0.7                                
  title "Controlli vari tipo host"             
  desc "Si controlla che l'host sia raggiungibile e che corrisponda l'indirizzo IP deciso in fase di costruzione container"
  describe host('client-0') do
    it { should be_reachable }
    it { should be_resolvable }
    its('connection') { should_not match /connection refused/ }
    its('ipaddress') { should include '172.18.0.4' }
  end
end

control "Connessione client-1" do                        
  impact 0.7                                
  title "Controlli vari tipo host"             
  desc "Si controlla che l'host sia raggiungibile e che corrisponda l'indirizzo IP deciso in fase di costruzione container.
  Mi aspetto il fallimento del primo test (e quindi del controllo) in quanto la porta 5002 non è esposta nel container ma su localhost"
  describe host('client-1', port:5002, protocol:'tcp') do
    it { should be_reachable }
    it { should be_resolvable }
    its('connection') { should_not match /connection refused/ }
    its('ipaddress') { should include '172.18.0.5' }
  end
end

control "Connessione client-2" do                        
  impact 0.7                                
  title "Controlli vari tipo host"             
  desc "Si controlla che l'host sia raggiungibile. Mi aspetto un fallimento di controllo e test in quanto client-2 non esiste"
  describe host('client-2') do
    it { should be_reachable }
    it { should be_resolvable }
  end
end
