# Class: admintools::make
#
# This module manages make for vmtools install
#
class admintools::make {

  package { 'make':    ensure => present, }

}
