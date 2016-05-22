
include_recipe 'apache2'

user 'jetty' do
  comment 'Jetty User'
  system true
  shell '/bin/bash'
end

execute 'jetty_repo' do
  command 'curl -s https://packagecloud.io/install/repositories/visibilityspots/yum-repo-server/script.rpm.sh | bash'
  action :run
  not_if { ::File.exist?('/etc/yum.repos.d/visibilityspots_yum-repo-server.repo') }
end

package 'jetty' do
  action :install
end

%w(logs webapps).each do |dir|
  directory "/opt/jetty/#{dir}" do
    owner 'jetty'
    group 'jetty'
    mode 00755
    recursive true
    action :create
  end
end

remote_file '/opt/jetty/webapps/jenkins.war' do
  source 'http://mirror.xmission.com/jenkins/war-stable/1.651.2/jenkins.war'
  owner 'jetty'
  group 'root'
  action :create_if_missing
  not_if { ::File.exist?('/opt/jetty/webapps/jenkins.war') }
end

cookbook_file '/opt/jetty/webapps/jenkins.xml' do
  source 'jenkins.xml'
  owner 'jetty'
  group 'jetty'
  mode 00644
end

service 'jetty' do
  init_command '/opt/jetty/bin/jetty.sh'
  supports :restart => true
  action [:start]
end

template '/etc/httpd/conf-enabled/jenkins.conf' do
  source 'httpd_jenkins.conf.erb'
  owner 'root'
  group 'root'
  mode 00644
  notifies :restart, 'service[apache2]', :delayed
end
