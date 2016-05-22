name             'ciklum'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures ciklum'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'mysql', '~> 7.1'
depends 'php', '~> 1.9.0'
depends 'apache2', '~> 3.2.2'
depends 'mysql', '~> 7.1.0'
depends 'firewall', '~> 2.5.0'
