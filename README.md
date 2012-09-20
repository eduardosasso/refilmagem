# Refilmagem

### Node console
	node
	g = require("./lib/google_movies");
	url = "http://www.google.com.br/movies?near=san+bruno,+ca,+usa&tid=22df0cb0e2273c4e"
	google_movies = new g(url);
	google_movies.print();

### Specs
* coffee -wc .
* mocha

### Rails
rails s --port 4000
http://refilmagem.dev:4000/admin - (admin@example.com/password)

### Config folders
* /etc/nginx
* /var/log/nginx/access.log
* /var/log/nginx/error.log

### Deploy
* cap deploy:check

### mysql 5.5
	rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm
	http://www.if-not-true-then-false.com/2010/install-mysql-on-fedora-centos-red-hat-rhel/
	mysql -u root -p
	grant all on *.* to root@'24.143.227.86' identified by 'menlopark111';

### Tips
	arch
	uname -a
	cat /etc/redhat-release