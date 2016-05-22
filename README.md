# ciklum
Test task


#Requirements

> vagrant plugin install vagrant-berkshelf<br>
> vagrant plugin install vagrant-omnibus<br>
> vagrant plugin install vagrant-vbguest<br>


#Vagrant run

>vagrant up

#Spec run

>chef exec rspec --format documentation --color spec cookbooks/ciklum/spec/*

#Kitchen

>kitchen test
