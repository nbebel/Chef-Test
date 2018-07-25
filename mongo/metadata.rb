name              'mongodb'
maintainer        'Nick Bebel'
maintainer_email  'nbebel@gmail.cpom'
license           'Apache-2.0'
description       'Installs and configures mongodb'
version           '0.16.3'

depends 'yum', '>= 3.0'

depends 'mongo'

redhat.each do |os|
	supports os
end
