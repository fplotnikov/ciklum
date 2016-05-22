require 'spec_helper'

describe 'ciklum::default' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge('ciklum::default') }

  before do
    stub_command("/usr/sbin/apache2 -t").and_return(true)
  end

  describe 'Recipes' do
    it 'includes php' do
      expect(chef_run).to include_recipe('php')
    end
  end

  describe 'Packages' do
    it 'installs vim' do
      expect(chef_run).to install_package('vim-enhanced')
    end
  end

end
