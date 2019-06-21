# cron entry for apticron
# this file is managed by Puppet

45 7 1 * * root if test -x /usr/sbin/apticron; then /usr/sbin/apticron --cron; else true; fi
