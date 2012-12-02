# Refilmagem

# Compile and watch coffee script changes
* coffee -wc -o ./lib .

### Test showtimes
cd refilmagem/app/api
node lib/print_showtimes google_movies

### Node console
	cd refilmagem/app/api
	node
	g = require("./lib/google_movies");
	url = "http://www.google.com.br/movies?near=porto+alegre&tid=1f76f971434a044"
	google_movies = new g(url, function(movies){
		console.log(movies);
	});

	google = require("./lib/google_movies");
	google.example();

### Specs
* mocha
* mocha -w -t 5000

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