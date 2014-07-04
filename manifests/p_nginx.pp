node default {
class { 'nginx': }
#Erasing the default index page and replacing it with Hello World
file {'/usr/share/nginx/html/index.html':
content => "Hello World",
require => Class["nginx"]
}
}