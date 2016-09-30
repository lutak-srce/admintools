# Class: admintools::buildchain
#
# This module manages build utils
#
class admintools::buildchain {

  include ::tools::make
  package { 'gcc':     ensure => present, }
  package { 'gcc-c++': ensure => present, }
  include ::tools::kernel::headers
  include ::tools::kernel::devel

}
