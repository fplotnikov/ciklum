require 'spec_helper'

describe 'ciklum::default' do
  let(:runner) { ChefSpec::SoloRunner.new.converge('ciklum::default') }

  before do
    stub_command("/usr/sbin/apache2 -t").and_return(true)
  end

  describe 'Apache' do
    it 'uses the apache2 community cookbook' do
      expect(runner).to include_recipe('apache2')
    end
    it 'SSL Certificate' do
      expect(runner).to render_file('/etc/httpd/ssl/localhost.crt')
    end
    it 'SSL Key' do
      expect(runner).to render_file('/etc/httpd/ssl/localhost.key')
    end
    it 'Expect phpinfo' do
      expect(runner).to render_file('/var/www/html/phpinfo.php')
    end
    it 'enables a service apache2' do
      expect(runner).to enable_service('apache2')
    end
  end
end
