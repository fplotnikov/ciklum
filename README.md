# ciklum
Test task


#Requirements

vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-vbguest


#Vagrant run

vagrant up

#Spec run

chef exec rspec --format documentation --color spec cookbooks/ciklum/spec/*

#Kitchen

kitchen test
