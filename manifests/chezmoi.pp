#
# Class: admintools::chezmoi
#
# This modules installs chezmoi
#
class admintools::chezmoi {

  package { 'chezmoi': ensure => present, }

}
