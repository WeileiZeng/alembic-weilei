#echo this script will start the server at local host. this may take 10 seconds
build:
	jekyll build
serve:
	bundle exec jekyll serve 2>&1 | grep -E -v 'deprecated|GitHub Metadata'
#the last part deprecate some long unimportant warnings
# In general, use the following cmd to serve
#	bundle exec jekyll serve
deploy-github:
	git push
deploy-raspebrry:
#	tar cf - _site | ssh pi@raspberrypi.attlocal.net '(cd ~/working/website/; tar xf - )'
#	scp -r _site pi@raspberrypi.attlocal.net:~/working/website
	echo "This send files in _site to raspberry pi. Make sure it has been built to the newst version"
	rsync -av --delete --exclude 'log' _site pi@raspberrypi.attlocal.net:~/working/website
	ssh -t pi@raspberrypi.attlocal.net 'sudo cp -r ~/working/website/_site/* /www/wwwroot/home'
# the last part is used to suppress warning
# 2>&1 | grep -E -v 'deprecated|GitHub Metadata'
