name              'mongodb'
maintainer        'edelight GmbH'
maintainer_email  'markus.korn@edelight.de'
license           'Apache-2.0'
description       'Installs and configures mongodb'
version           '0.16.3'

depends 'yum', '>= 3.0'
depends 'mongo'

redhat.each do |os|
	supports os
end
