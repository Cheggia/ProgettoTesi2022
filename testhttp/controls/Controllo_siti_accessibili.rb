# you add controls here
control "localhost control 01" do              			# A unique ID for this control
  impact 0.7                                				# The criticality, if this control fails.
  title "Controllo degli urls localhost:500x/check"         	# A human-readable title
  desc "Vengono controllati gli indirizzi. Devono essere raggiungibili e test di \"salute\""
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

control "localhost control 02" do              		# A unique ID for this control
  impact 0.7                                		# The criticality, if this control fails.
  title "Controllo degli urls localhost:500x/form"            # A human-readable title
  desc "Vengono controllati gli indirizzi. Devono essere raggiungibili e test su cosa contengono"
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
