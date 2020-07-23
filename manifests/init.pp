#
# Class: admintools
#
# This modules installs basic administration utilities
#

class admintools {

  include ssh
  include tools::ltrace
  include tools::screen
  include tools::tcpdump
  include tools::tmux
  include tools::vim

  package { 'atop'            : ensure => present, }
  package { 'bash-completion' : ensure => present, }
  package { 'binutils'        : ensure => present, }
  package { 'chezmoi'         : ensure => present, }
  package { 'expect'          : ensure => present, }
  package { 'gawk'            : ensure => present, }
  package { 'htop'            : ensure => present, }
  package { 'iftop'           : ensure => present, }
  package { 'iotop'           : ensure => present, }
  package { 'lsof'            : ensure => present, }
  package { 'mc'              : ensure => present, }
  package { 'mutt'            : ensure => present, }
  package { 'ncdu'            : ensure => present, }
  package { 'nmap'            : ensure => present, }
  package { 'psmisc'          : ensure => present, }
  package { 'rsync'           : ensure => present, }
  package { 'strace'          : ensure => present, }
  package { 'sysstat'         : ensure => present, }
  package { 'telnet'          : ensure => present, }
  package { 'wget'            : ensure => present, }
  package { 'zsh'             : ensure => present, }

  case $::osfamily {
    default: { }
    /(Debian|debian|Ubuntu|ubuntu)/: {
      package { 'apticron'    : ensure => present, }
      package { 'bind9utils'  : ensure => present, }
      package { 'changetrack' : ensure => present, }
      package { 'debsums'     : ensure => present, }
      package { 'dnsutils'    : ensure => present, }
      package { 'etckeeper'   : ensure => present, }
      package { 'sg3-utils'   : ensure => present, }
      file { '/etc/cron.d/apticron':
        source => 'puppet:///modules/admintools/apticron/cron.d',
      }
    }
    /(RedHat|redhat|amazon)/: {
      package { 'bind-utils' : ensure => present, }
    }
  }

  case $::operatingsystem {
    default: { }
    'CentOS' : {
      case $::operatingsystemrelease {
        default : {
          package { 'man' : ensure => present, }
        }
        /^7.*/: {
          package { 'man-db'    : ensure => present, }
          package { 'man-pages' : ensure => present, }
        }
      }
    }
    'Debian' : {
      case $::operatingsystemrelease {
        default : { }
        /^(9|10).*/: {
          package { 'fzf' : ensure => present, }
        }
      }
    }
    'Fedora' : {
      package { 'man-db'    : ensure => present, }
      package { 'man-pages' : ensure => present, }
    }
  }

}
