control 'mysql-conf-01' do
  impact 0.5
  title 'ensure the service is enabled and running'
  describe service('mysqld') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end

control 'mysql-conf-02' do
  impact 0.5
  title 'controllo porta 3306 e socket'
  describe mysql_conf('/etc/mysql/mysql.conf.d/mysqld.cnf') do
    its('mysqld.port') { should cmp '3306' }
    its('socket') { should eq 'var/run/mysqld/mysqld.sock' }
  end
end

control 'mysql-conf-03' do
  impact 0.5
  title 'root possiede il file di config?'
  describe file('/etc/mysql/my.cnf') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should_not be_readable.by('others') }
  end
end

control 'mysql-conf-04' do
  impact 0.5
  title 'solo un istanza di mysql sul server'
  describe command('ps aux | grep mysqld | egrep -v "grep|mysqld_safe|logger" | wc -l') do
    its(:stdout) { should match '1' }
    its(:stdout) { should match '0' }
  end
end



