control "Accesso URL 1" do              			
  impact 0.7                                				
  title "URL http://localhost:500x/check"         	        
  desc "Vengono controllati gli indirizzi. Devono essere raggiungibili e superare il test di \"salute\""
  describe http('http://localhost:5000/check') do
     its('status') { should eq 200 }
     its('body') { should include 'healthy' }
     its('body') { should include 'server-0' }
   end
   describe http('http://localhost:5001/check') do
     its('status') { should eq 200 }
     its('body') { should include 'healthy' }
     its('body') { should include 'client-0' }
   end
   describe http('http://localhost:5002/check') do
     its('status') { should eq 200 }
     its('body') { should include 'healthy' }
     its('body') { should include 'client-1' }
   end
end
control "Accesso URL 2" do              		
  impact 0.7                                		
  title "URL http://localhost:500x/form"           
  desc "Vengono controllati gli indirizzi. Devono essere raggiungibili e superare il test su cosa contengono"
  describe http('http://localhost:5001/form') do
     its('status') { should eq 200 }
     its('body') { should include 'client-0' }
     its('body') { should include 'Ricerca una lista di utenti' }
     its('body') { should include 'input type="text"' }
     its('body') { should include 'button type="submit"' }
   end
   describe http('http://localhost:5002/form') do
     its('status') { should eq 200 }
     its('body') { should include 'client-1' }
     its('body') { should include 'Ricerca una lista di utenti' }
     its('body') { should include 'input type="text"' }
     its('body') { should include 'button type="submit"' }
   end
end
control "Accesso URL 3" do              		
  impact 0.7                                		
  title "URL http://172.18.0.x:5000/form"           
  desc "Ha lo stesso effetto di Accesso URL 2 ma mostra come le porte di comunicazione siano differenti. I container lavorano su proprie porte e consentono di esporre all'esterno su docker client queste porte effettuando un remapping. Server-0, client-0, client-1 lavorano tutte su porta 5000 come standard framework flask. Siccome non è possibile mappare tre servizi sulla porta 5000 del docker client, server-0 mantiene la porta 5000 mentre client-0 e client-1 sono stati rimappati sulle porte 5001 e 5002"
  describe http('http://172.18.0.4:5000/form') do
     its('status') { should eq 200 }
     its('body') { should include 'client-0' }
     its('body') { should include 'Ricerca una lista di utenti' }
     its('body') { should include 'input type="text"' }
     its('body') { should include 'button type="submit"' }
   end                      
   describe http('http://172.18.0.5:5000/form') do
     its('status') { should eq 200 }
     its('body') { should include 'client-1' }
     its('body') { should include 'Ricerca una lista di utenti' }
     its('body') { should include 'input type="text"' }
     its('body') { should include 'button type="submit"' }
   end
end
