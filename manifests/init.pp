class netvault  {

require netvault::params

file { "/root/netvault-is.tgz": 
   ensure => present,
   source => "puppet:///modules/netvault/netvault-is.tgz"
}

service { "netvault":
	ensure => "running",
	enable => "true"
}

exec { "untar netvault":
		require => File["/root/netvault-is.tgz"],
		command => "/bin/tar xzvf /root/netvault-is.tgz",
		cwd => "/root/",
		creates => "/root/netvault/"
}

exec { "configure netvault":
		require => Exec["untar netvault"],
		command => "/root/netvault/install response",
		cwd => "/root/netvault/",
		creates => "/usr/netvault/"
	}


file { "/usr/netvault/config/firewall.cfg":
	name => "/usr/netvault/config/firewall.cfg",
	ensure => "present",
	content => template("netvault/firewall.cfg.erb"),
	notify => Exec["reload-netvault"]
}

file { "/usr/netvault/config/nvnmgr.cfg":
        name => "/usr/netvault/config/nvnmgr.cfg",
        ensure => "present",
        content => template("netvault/nvnmgr.cfg.erb"),
#        notify => Exec["reload-netvault"]
}

file { "/usr/netvault/config/nvfs.cfg":
        name => "/usr/netvault/config/nvfs.cfg",
        ensure => "present",
        content => template("netvault/nvfs.cfg.erb"),
        notify => Exec["reload-netvault"]
}

file { "/usr/netvault/config/configure.cfg":
        name => "/usr/netvault/config/configure.cfg",
        ensure => "present",
        content => template("netvault/configure.cfg.erb"),
        notify => Exec["reload-netvault"]
}



# stop service, update config, start service
exec { 'reload-netvault':
  command => '/etc/init.d/netvault stop && /etc/init.d/netvault start',
  refreshonly => true,
  path => ["/usr/sbin", "/usr/bin", "/sbin", "/bin/"],
  logoutput => false
}



}

