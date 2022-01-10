control 'Controllo di base dei container' do
  impact 0.5
  title 'Il codice controlla gli aspetti base del container'
  describe docker_container(name: 'container_mysql-0_1') do
     it { should exist }
     it { should be_running }
     # Next command must be a failure during test
     its('id') { should eq '13fdf974c767dd861713f59e7aea3fedc221c2b7a75893d4aff2b0e049b99925' }
     its('image') { should eq 'mysql:5.7' }
     its('repo') { should eq 'mysql' }
     its('tag') { should eq '5.7' }
     its('ports') { should eq '0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp'}
  end    
     describe docker_container(name: 'container_server-0_1') do
     it { should exist }
     it { should be_running }
     # Next command must be a failure during test
     its('id') { should eq '5c5842fca67d0e163a48bc5381eb59ffd69e740197f9a0950b2f50eaed133f27' }
     its('image') { should eq 'container_server-0' }
     its('repo') { should eq 'container_server-0' }
     its('ports') { should eq '0.0.0.0:5000->5000/tcp, :::5000->5000/tcp'}
  end
     describe docker_container(name: 'container_client-0_1') do
     it { should exist }
     it { should be_running }
     # Next command must be a failure during test
     its('id') { should eq '3f34df0e8578007f6bbc21606915a4e5516903a1c291e9f856ebef10fe9c1d9b' }
     its('image') { should eq 'container_client-0' }
     its('repo') { should eq 'container_client-0' }
     its('ports') { should eq '0.0.0.0:5001->5000/tcp, :::5001->5000/tcp'}
  end
     describe docker_container(name: 'container_client-1_1') do
     it { should exist }
     it { should be_running }
     # Next command must be a failure during test
     its('id') { should eq '8250b0bace8f87697cbe3075d71f4ea09eab1ad25b16df140ece8c85d8cb6f84' }
     its('image') { should eq 'container_client-1' }
     its('repo') { should eq 'container_client-1' }
     its('ports') { should eq '0.0.0.0:5002->5000/tcp, :::5002->5000/tcp'}
  end
end
