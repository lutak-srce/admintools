# Class: admintools
#
# This modules installs basic administration utilities
#

class admintools {
  include ::ssh
  include ::tools::vim

  package { 'wget':         ensure => present, }
  package { 'rsync':        ensure => present, }

  # admin tools
  package { 'nmap':         ensure => present, }
  include ::tools::screen
  include ::tools::tmux
  package { 'zsh':          ensure     => present, }
  package { 'atop':         ensure     => present, }
  package { 'htop':         ensure     => present, }
  package { 'mutt':         ensure     => present, }
  package { 'iftop':        ensure     => present, }
  package { 'iotop':        ensure     => present, }
  package { 'tcpdump':      ensure     => present, }
  package { 'mc':           ensure     => present, }
  package { 'ncdu':         ensure     => present, }
  package { 'strace':       ensure     => present, }
  package { 'telnet':       ensure     => present, }
  package { 'lsof':         ensure     => present, }
  package { 'expect':       ensure     => present, }
  package { 'gawk':         ensure     => present, }
  package { 'psmisc':       ensure     => present, }
  package { 'binutils':     ensure     => present, }

  case $::osfamily {
    default: { }
    /(Debian|debian|Ubuntu|ubuntu)/: {
      package { 'bind9utils':      ensure => present, }
      package { 'etckeeper':       ensure => present, }
      package { 'changetrack':     ensure => present, }
      package { 'apticron':        ensure => present, }
    }
    /(RedHat|redhat|amazon)/: {
      package { 'bind-utils':      ensure => present, }
    }
  }

  case $::operatingsystem {
    default: { }
    'CentOS' : {
      case $::operatingsystemrelease {
        default : {
          package { 'man':       ensure => present, }
        }
        /^7.*/: {
          package { 'man-db':    ensure => present, }
          package { 'man-pages': ensure => present, }
        }
      }
    }
    'Fedora' : {
      package { 'man-db':    ensure => present, }
      package { 'man-pages': ensure => present, }
    }
  }
}
