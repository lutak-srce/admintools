# Class: admintools::buildchain
#
# This module manages build utils
#
class admintools::buildchain {

  include ::tools::make
  package { 'gcc':     ensure => present, }
  package { 'gcc-c++': ensure => present, }
  package { 'kernel-headers': ensure => present, }
  package { 'kernel-devel':   ensure => present, }

}
