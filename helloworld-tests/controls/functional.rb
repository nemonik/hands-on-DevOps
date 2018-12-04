# encoding: utf-8

control 'docker-checks-1.1' do
  impact 0.7 # High Impact
  tag "nist": ['CM-6', 'Rev_4']
  title 'Verify Docker Container exists and is running'

  describe docker_container(name: 'helloworld-web') do
    it { should exist }
    it { should be_running }
    its('repo') { should eq 'nemonik/helloworld-web' }
    its('ports') { should eq '0.0.0.0:3000->3000/tcp' }
    its('command') { should eq '/app/helloworld-web' }
  end

  # you can even test if it does what it should :)
  #describe http("http://#{application_url}", enable_remote_worker: true) do
  #  its('body.chomp') { should cmp 'Hello world!' }
  #end

end
