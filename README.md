Refilmagem is all about movies.

** Setup **
- /etc/nginx
- /var/log/nginx/access.log
- /var/log/nginx/error.log

** mysql 5.5
rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm
http://www.if-not-true-then-false.com/2010/install-mysql-on-fedora-centos-red-hat-rhel/
mysql -u root -p
grant all on *.* to root@'24.143.227.86' identified by 'menlopark111';

arch
uname -a
cat /etc/redhat-release

* Deploy
cap deploy:check
