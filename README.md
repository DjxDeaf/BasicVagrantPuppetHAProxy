BasicVagrantPuppetHAProxy
=========================

Creating a HAProxy server with 2 Nginx servers using Vagrant and Puppet.
The HAProxy serves as a Load Balancer for 2 Nginx web servers on port 80, including roundrobin and http check for the nodes.

Dependencies:
vagrant plugin install vagrant-hosts, 
puppet module install puppetlabs-haproxy,
puppet module install jfryman-nginx,


