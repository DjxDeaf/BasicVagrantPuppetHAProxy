Basic Environment - Vagrant + Puppet + HAProxy
=========================

Components:

- Two VMs that act as Web servers and run Nginx
- The web servers serve a simple page that prints "Hello World!"
- Third VM acts as a load balancer for the web servers VMs
- HAProxy is used as Load balancer

---

Requirements:

- CentOS 6.x as Linux Distribution
- Puppet as provisioner (see link below)
- Puppet version 3 and up compatible recipes
- HAproxy configured using HAProxy puppet module (see link below)
- HAProxy balances requests between the web servers
- HAProxy should be able to fail-over in-case one of the web servers goes down.
- HAProxy must be accessible from outside the LAB. For example, surfing to `http://<HAPROXY-IP>` should work

The end result should be similar to the following diagram:

```
                           VM2 (Web server)
                             +---------+
                 +-------->  |  Nginx  |
   VM1 (LB)      |           +---------+
+------------+   |
|  HAProxy   +---+
+------------+   |         VM3 (Web server)
                 |           +---------+
                 +-------->  |  Nginx  |
                             +---------+
```

---

**Tools used**

- [HAProxy](http://haproxy.1wt.eu)
- [Nginx](http://nginx.org/en/download.html)
- [Puppet](http://puppetlabs.com/puppet/puppet-open-source)
- [Vagrant](http://www.vagrantup.com)
- [Virtualbox](https://www.virtualbox.org)

**References**

- [Puppet Docs](http://docs.puppetlabs.com/puppet/)
- [Puppet HAProxy module](https://github.com/puppetlabs/puppetlabs-haproxy)
- [Vagrant with Puppet provisioner](http://docs.vagrantup.com/v2/provisioning/puppet_apply.html)

**Dependencies**
- vagrant plugin install vagrant-hosts, 
- puppet module install puppetlabs-haproxy,
- puppet module install jfryman-nginx,


