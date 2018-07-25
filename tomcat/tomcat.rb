package 'java-1.7.0-openjdk-devel' do
	action :install
end

group 'tomcat' do
	gid '123'
end

user 'tomcat' do
	home '/opt/tomcat'
	shell '/bin/nologin'
	gid '123'
end

bash 'tomcat_extract' do
	cwd '/tmp'
	code <<-EOH
	wget http://apache.cs.utah.edu/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.32.tar.gz
	sudo mkdir /opt/tomcat
	sudo tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1
	EOH
end

bash 'permissions' do
	cwd '/opt/tomcat'
	code <<-EOH
	sudo chgrp -R tomcat /opt/tomcat
	sudo chmod -R g+r conf
	sudo chmod g+x conf
	sudo chown -R tomcat webapps/ work/ temp/ logs/
	EOH
end

systemd_unit 'tomcat.service' do
	action :install
end

sudo 'enable' do
	commands ['systemctl daemon-reload systemctl start tomcat systemctl enable tomcat']
end

bash 'apt-get_update' do
	code <<-EOH
	apt-get update
	EOH
end

apt_package %w(build-essential libssl-dev libyaml-dev libreadline-dev openssl curl git-core zlib1g-dev bison libxml2-dev libxslt1-dev libcurl4-openssl-dev nodejs libsqlite3-dev sqlite3) do
	action :install
end

bash 'ruby' do
	code <<-EOH
	mkdir ~/ruby
	cd ~/ruby
	wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.3.tar.gz
	tar -xzf ruby-2.1.3.tar.gz
	cd ruby-2.1.3
	./configure
	make install
	rm -rf ~/ruby
	EOH
end
