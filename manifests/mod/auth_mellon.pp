class apache::mod::auth_mellon (
  $verifyServerCert = true,
) {
  ::apache::mod { 'auth_mellon': }

  validate_bool($verifyServerCert)

  # Template uses:
  # - $verifyServerCert
  file { 'auth_mellon.conf':
    ensure  => file,
    path    => "${::apache::mod_dir}/auth_mellon.conf",
    content => template('apache/mod/auth_mellon.conf.erb'),
    require => Exec["mkdir ${::apache::mod_dir}"],
    before  => File[$::apache::mod_dir],
    notify  => Service['httpd'],
  }
}
