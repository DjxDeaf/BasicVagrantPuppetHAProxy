node 'haproxynode' {
  class { 'haproxy': }
  haproxy::listen { 'Webpool':
  collect_exported => false,
  ipaddress => '*',
  ports => '80',
  options => {'option' => ['tcplog','httpchk HEAD / HTTP/1.0'],'balance' => ['roundrobin']}
}

  haproxy::balancermember { 'nginx-1':
    listening_service => 'Webpool',
    server_names      => 'nginx1node.local',
    ipaddresses       => '192.168.56.3',
    ports             => '80',
    options           => 'check'
  }
  haproxy::balancermember { 'nginx-2':
    listening_service => 'Webpool',
    server_names      => 'nginx2node.local',
    ipaddresses       => '192.168.56.4',
    ports             => '80',
    options           => 'check'
  }
}