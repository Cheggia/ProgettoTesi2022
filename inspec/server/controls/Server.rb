control "Porta 5000" do                        
  impact 0.7                                
  title "Controllo porta 5000 su server-0"             
  desc "Si controlla che la porta 5000 sia in ascolto per connessioni tcp"
  describe port('5000') do
     it {should be_listening}
     its('protocols') {should include 'tcp'}
  end
end

control "Connessione con mysql-0" do                        
  impact 0.7                                
  title "Controlli vari tipo host"             
  desc "Si controlla che l'host sia raggiungibile e che corrisponda l'indirizzo IP"
  describe host('mysql-0', port:3306, protocol:'tcp') do
    it { should be_reachable }
    it { should be_resolvable }
    its('connection') { should_not match /connection refused/ }
    its('ipaddress') { should include '172.18.0.2' }
  end
end

control "Connessione con client-0" do                        
  impact 0.7                                
  title "Controlli vari tipo host"             
  desc "Si controlla che l'host sia raggiungibile e che corrisponda l'indirizzo IP"
  describe host('client-0', port:5001, protocol:'tcp') do
    it { should be_reachable }
    it { should be_resolvable }
    its('connection') { should_not match /connection refused/ }
    its('ipaddress') { should include '172.18.0.4' }
  end
end

control "Connessione con client-1" do                        
  impact 0.7                                
  title "Controlli vari tipo host"             
  desc "Si controlla che l'host sia raggiungibile e che corrisponda l'indirizzo IP"
  describe host('client-1', port:5002, protocol:'tcp') do
    it { should be_reachable }
    it { should be_resolvable }
    its('connection') { should_not match /connection refused/ }
    its('ipaddress') { should include '172.18.0.5' }
  end
end

control "Connessione con localhost" do                        
  impact 0.7                                
  title "Controlli vari tipo host"             
  desc "Si controlla che l'host sia raggiungibile e che corrisponda l'indirizzo IP"
  describe host('localhost', port:5000, protocol:'tcp') do
    it { should be_reachable }
    it { should be_resolvable }
    its('connection') { should_not match /connection refused/ }
    its('ipaddress') { should include '127.0.0.1' }
  end
end
