#
# Cookbook Name:: ciklum
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'php'

include_recipe 'apache2::mod_deflate'
include_recipe 'apache2::mod_rewrite'
include_recipe 'apache2::mod_ssl'
include_recipe 'apache2::mod_status'
include_recipe 'apache2::mod_php5'
include_recipe 'apache2::mod_expires'
include_recipe 'apache2::mod_proxy'
include_recipe 'apache2::mod_proxy_http'

node['ciklum']['packages'].each do |package_name|
  package package_name do
    action :install
  end
end

# install mysql
mysql_service 'mysql' do
  port '3306'
  version '5.5'
  initial_root_password 'blabla'
  action [:create, :start]
end

file '/var/www/html/phpinfo.php' do
  content '<?php phpinfo(); ?>'
  owner 'root'
  group 'root'
  mode 00644
  action :create
end

cookbook_file '/etc/httpd/ssl/localhost.crt' do
  source 'localhost.crt'
  owner 'root'
  group 'root'
  mode 00644
end

cookbook_file '/etc/httpd/ssl/localhost.key' do
  source 'localhost.key'
  owner 'root'
  group 'root'
  mode 00644
end

web_app 'ciklum' do
  server_name '192.168.30.30'
  server_aliases [node['fqdn'], "192.168.30.30"]
  docroot "/var/www/html"
  template 'httpd_default.conf.erb'
end

web_app 'ciklum-ssl' do
   server_name '192.168.30.30'
   server_aliases [node['fqdn'], "192.168.30.30"]
   docroot "/var/www/html"
   server_port '443'
   sslcert 'localhost.crt'
   sslkey 'localhost.key'
   template 'httpd_default.conf.erb'
end
