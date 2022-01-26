control "Porta 5000, 5001, 5002" do                        
  impact 0.7                                
  title "Controllo porte"             
  desc "Si controlla che la porta 5000 sia in ascolto per connessioni tcp"
  describe port('5000') do
     it {should be_listening}
     its('protocols') {should include 'tcp'}
  end
  describe port('5001') do
     it {should_not be_listening}
  end
  describe port('5002') do
     it {should_not be_listening}
  end
end
  
control "Connessione con server-0" do                        
  impact 0.7                                
  title "Controlli vari tipo host"             
  desc "Si controlla che l'host sia raggiungibile e che corrisponda l'indirizzo IP"
  describe host('server-0', port:5000, protocol:'tcp') do
    it { should be_reachable }
    it { should be_resolvable }
    its('connection') { should_not match /connection refused/ }
    its('ipaddress') { should include '172.18.0.3' }
  end
end

control "Processo app.py" do                        
  impact 0.7                                
  title "Controllo che il processo sia in esecuzione"             
  desc "il processo python app.py è il processo che origina il container e che inidica al container il suo comportamento"
  describe processes('python app.py') do
    it { should exist }
    its('users') { should eq ['root'] }
  end
end
