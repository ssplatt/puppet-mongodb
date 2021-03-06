# == Class: mongodb
#
# Direct use of this class is deprecated. Please use mongodb::server
#
# Manage mongodb installations on RHEL, CentOS, Debian and Ubuntu - either
# installing from the 10Gen repo or from EPEL in the case of EL systems.
#
# === Parameters
#
# init (auto discovered) - override init (sysv or upstart) for Debian derivatives
# location - override apt location configuration for Debian derivatives
# packagename (auto discovered) - override the package name
# servicename (auto discovered) - override the service name
# service-enable (default: true) - Enable the service and ensure it is running
#
# === Examples
#
# To install with defaults from the distribution packages on any system:
#   include mongodb
#
# To install from 10gen on a EL server
#   class { 'mongodb':
#     enable_10gen => true,
#   }
#
# === Authors
#
# Craig Dunn <craig@craigdunn.org>
#
# === Copyright
#
# Copyright 2013 PuppetLabs
#
class mongodb (
  # Deprecated parameters
  $enable_10gen     = undef,

  $init             = $mongodb::params::service_provider,
  $packagename      = undef,
  $version          = undef,
  $servicename      = $mongodb::params::service_name,
  $service_enable   = true, #deprecated
  $logpath          = $mongodb::params::logpath,
  $logappend        = true,
  $system_logrotate = undef,
  $fork             = $mongodb::params::fork,
  $port             = undef,
  $dbpath           = $mongodb::params::dbpath,
  $journal          = undef,
  $nojournal        = undef,
  $smallfiles       = undef,
  $cpu              = undef,
  $noauth           = undef,
  $auth             = undef,
  $verbose          = undef,
  $objcheck         = undef,
  $quota            = undef,
  $oplog            = undef, #deprecated it's on if replica set
  $oplog_size       = undef,
  $nohints          = undef,
  $nohttpinterface  = undef,
  $noscripting      = undef,
  $notablescan      = undef,
  $noprealloc       = undef,
  $nssize           = undef,
  $mms_token        = undef,
  $mms_name         = undef,
  $mms_interval     = undef,
  $slave            = undef,
  $only             = undef,
  $master           = undef,
  $source           = undef,
  $configsvr        = undef,
  $shardsvr         = undef,
  $replset          = undef,
  $rest             = undef,
  $quiet            = undef,
  $slowms           =  undef,
  $keyfile          = undef,
  $key              = undef,
  $ipv6             = undef,
  $bind_ip          = undef,
  $pidfilepath      = undef,
  $pidfilemode      = undef,
  Optional[String] $ldap_servers             = undef,
  Optional[String] $ldap_authz_querytemplate = undef,
  Optional[String] $ldap_bind_queryUser      = undef,
  Optional[String] $ldap_bind_queryPassword  = undef,
  Optional[String] $ldap_bind_method         = undef,
  Optional[String] $ldap_bind_saslmechanisms = undef,
  Optional[String] $ldap_bind_useosdefaults  = undef,
  Optional[String] $ldap_transportSecurity   = undef,
  Optional[String] $ldap_usertodnmapping     = undef,

) inherits mongodb::params {

  notify { 'An attempt has been made below to automatically apply your custom
    settings to mongodb::server. Please verify this works in a safe test
    environment.': }


  class { '::mongodb::server':
    package_name                => $packagename,
    logpath                     => $logpath,
    logappend                   => $logappend,
    fork                        => $fork,
    port                        => $port,
    dbpath                      => $dbpath,
    journal                     => $journal,
    nojournal                   => $nojournal,
    smallfiles                  => $smallfiles,
    cpu                         => $cpu,
    noauth                      => $noauth,
    verbose                     => $verbose,
    objcheck                    => $objcheck,
    quota                       => $quota,
    oplog_size                  => $oplog_size,
    nohints                     => $nohints,
    nohttpinterface             => $nohttpinterface,
    noscripting                 => $noscripting,
    notablescan                 => $notablescan,
    noprealloc                  => $noprealloc,
    nssize                      => $nssize,
    mms_token                   => $mms_token,
    mms_name                    => $mms_name,
    mms_interval                => $mms_interval,
    slave                       => $slave,
    only                        => $only,
    master                      => $master,
    source                      => $source,
    configsvr                   => $configsvr,
    shardsvr                    => $shardsvr,
    replset                     => $replset,
    rest                        => $rest,
    quiet                       => $quiet,
    slowms                      => $slowms,
    keyfile                     => $keyfile,
    key                         => $key,
    ipv6                        => $ipv6,
    bind_ip                     => $bind_ip,
    pidfilepath                 => $pidfilepath,
    ldap_servers                => $ldap_servers,
    ldap_authz_querytemplate    => $ldap_authz_querytemplate,
    ldap_bind_queryUser         => $ldap_bind_queryUser,
    ldap_bind_queryPassword     => $ldap_bind_queryPassword,
    ldap_bind_method            => $ldap_bind_method,
    ldap_bind_saslmechanisms    => $ldap_bind_saslmechanisms,
    ldap_bind_useosdefaults     => $ldap_bind_useosdefaults,
    ldap_transportSecurity      => $ldap_transportSecurity,
    ldap_usertodnmapping        => $ldap_usertodnmapping,
  }

}
