control "porte 1.0" do                        
  impact 0.7                                
  title "Controllo porta 5000"             
  desc "Si controlla che la porta 5000 sia in ascolto sul server"
  describe port('5000') do
     it {should be_listening}
     its('protocols') {should include 'tcp'}
  end
end
