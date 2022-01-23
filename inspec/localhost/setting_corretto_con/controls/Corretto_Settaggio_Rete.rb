control 'Con_mysql' do
  impact 0.1
  title 'Controllo setting container mysql'
  desc 'Il controllo effettua dei test riguardo le impostazioni di base con cui viene creato il container mysql'
  describe docker_container(name: 'mysql') do
     it { should exist }
     it { should be_running }
     # Next command must be a failure during test
     its('id') { should eq '13fdf974c767dd861713f59e7aea3fedc221c2b7a75893d4aff2b0e049b99925' }
     its('image') { should eq 'mysql:5.7' }
     its('repo') { should eq 'mysql' }
     its('tag') { should eq '5.7' }
     its('ports') { should eq '0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp'}
     its('networks') { should eq 'shared-network' }
  end  
end

control 'Con_container_rete' do
  impact 1.0
  title 'Controllo setting containers server-0, client-0, client-1'
  desc 'Il controllo effettua dei test riguardo le impostazioni di base con cui vengono creati i containers server-0, client-0, client-1'
     describe docker_container(name: 'server-0') do
     it { should exist }
     it { should be_running }
     its('image') { should eq 'container_server-0' }
     its('repo') { should eq 'container_server-0' }
     its('ports') { should eq '0.0.0.0:5000->5000/tcp, :::5000->5000/tcp'}
  end
     describe docker_container(name: 'client-0') do
     it { should exist }
     it { should be_running }
     its('image') { should eq 'container_client-0' }
     its('repo') { should eq 'container_client-0' }
     its('ports') { should eq '0.0.0.0:5001->5000/tcp, :::5001->5000/tcp'}
  end
     describe docker_container(name: 'client-1') do
     it { should exist }
     it { should be_running }
     its('image') { should eq 'container_client-1' }
     its('repo') { should eq 'container_client-1' }
     its('ports') { should eq '0.0.0.0:5002->5000/tcp, :::5002->5000/tcp'}
  end
end


