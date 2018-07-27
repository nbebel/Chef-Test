# tomcat

NOTE:
Have not been successful yet in testing this.
Attempted to run locally with VirtualBox, Vagrant and ChefDK
Broke numerous times when attempting to Kitchen Converge

Have been attempting to run on Amazon server with Chef OpsWorks

From the starter kit, set up Berksfile, roles.rb and cookbooks folder

Set up kitchen.yml file

Install git on server
Pulled in git repo
Installed ChefDK

Kept seeing this error as I had on local
[2018-07-27T16:19:41+00:00] WARN: *****************************************
[2018-07-27T16:19:41+00:00] WARN: Did not find config file: /etc/chef/client.rb, using command line options.
[2018-07-27T16:19:41+00:00] WARN: *****************************************
Starting Chef Client, version 13.8.5
Creating a new client identity for ip-172-31-76-76.ec2.internal using the validator key.

================================================================================
Chef encountered an error attempting to create the client "ip-172-31-76-76.ec2.internal"


Ran chef-client --local-mode tomcat.rb
Response:
================================================================================
Chef encountered an error attempting to load the node data for "ip-172-31-76-76.ec2.internal"
================================================================================

Unknown Server Error:
---------------------
The server had a fatal error attempting to load the node data.

Seems to be permissions issue
