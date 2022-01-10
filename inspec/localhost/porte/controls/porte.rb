control "porte 1.0" do                        
  impact 0.7                                
  title "Controllo porte in ascolto"             
  desc "Vengono controllate le porte in ascolto su localhost"
  describe port('3306') do
     it { should be_listening }
     its('protocols') {should include 'tcp'}
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
