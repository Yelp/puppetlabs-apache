class apache::mod::authnz_mellon (
  $verifyServerCert = true,
) {
  include '::apache::mod::mellon'
  ::apache::mod { 'authnz_mellon': }

  validate_bool($verifyServerCert)

  # Template uses:
  # - $verifyServerCert
  file { 'authnz_mellon.conf':
    ensure  => file,
    path    => "${::apache::mod_dir}/authnz_mellon.conf",
    content => template('apache/mod/authnz_mellon.conf.erb'),
    require => Exec["mkdir ${::apache::mod_dir}"],
    before  => File[$::apache::mod_dir],
    notify  => Service['httpd'],
  }
}
