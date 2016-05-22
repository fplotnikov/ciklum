# all defaults
firewall 'default'

# enable platform default firewall
firewall 'default' do
  action :install
end

# open standard ssh port
firewall_rule 'ssh' do
  port     22
  command  :allow
end

firewall_rule 'http/https' do
  protocol :tcp
  port     [80, 443]
  command   :allow
end

firewall_rule 'localhost_in' do
  interface 'lo'
  protocol :none
  direction :in
  command    :allow
  position 1
end

firewall_rule 'localhost_out' do
  dest_interface 'lo'
  protocol :none
  direction :out
  command    :allow
  position 2
end
