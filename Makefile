#naive Makefile to get all the necessary files in the correct location for the site
WEBROOT = /var/www/html #web root for the site

#download and extract files and move them into the appropriate structure in this directory
all:
	wget https://github.com/twbs/bootstrap/releases/download/v4.4.1/bootstrap-4.4.1-dist.zip
	unzip bootstrap-4.4.1-dist.zip
	rm bootstrap-4.4.1-dist.zip

	mv bootstrap-4.4.1-dist/css ./
	mv bootstrap-4.4.1-dist/js ./
	rm -r bootstrap-4.4.1-dist

	mv css/bootstrap.css css/bootstrap.css.orig
	wget https://bootswatch.com/4/lux/bootstrap.css
	mv bootstrap.css css/bootstrap.css

#clean up current directory from additional files
clean:
	rm -rf css
	rm -rf js

#install the html and all other assets to the web root directory
install: all
	mkdir -p $(WEBROOT)

	cp *.html $(WEBROOT)/

	cp -r css $(WEBROOT)/
	cp -r js $(WEBROOT)/

#remove all the html and other assets from the web root directory
uninstall:
	rm -rf $(WEBROOT)/*
