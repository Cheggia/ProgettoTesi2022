control "Porte_in_ascolto" do                        
  impact 0.7                                
  title "Controllo relativo alle porte in porte in ascolto su localhost"             
  describe port('3306') do
     it { should be_listening }
  end
  describe port('5000') do
     it { should be_listening }
     its('protocols') {should include 'tcp'}
  end
  describe port('5001') do
     it { should be_listening }
     its('protocols') {should include 'tcp'}
  end
  describe port('5002') do
     it { should be_listening }
     its('protocols') {should include 'tcp'}
  end  
end
