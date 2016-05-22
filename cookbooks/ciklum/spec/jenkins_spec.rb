require 'spec_helper'

describe 'ciklum::jenkins' do
  let(:runner) { ChefSpec::SoloRunner.new.converge('ciklum::jenkins') }

  before do
    stub_command("/usr/sbin/apache2 -t").and_return(true)
  end

  describe 'Jenkins' do
    it 'uses the cookbook' do
      expect(runner).to include_recipe('ciklum::jenkins')
    end

    it 'installs the package' do
      expect(runner).to install_package('jetty')
    end

    it 'creates a webapps directory' do
      expect(runner).to create_directory("/opt/jetty/webapps")
    end

    it 'creates a remote_file with an explicit action' do
      expect(runner).to create_remote_file_if_missing('/opt/jetty/webapps/jenkins.war')
    end

    it 'Check jenkins.xml' do
      expect(runner).to render_file('/opt/jetty/webapps/jenkins.xml')
    end

    it 'starts the service' do
      expect(runner).to start_service('jetty')
    end
  end
end
