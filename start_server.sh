echo this script will start the server at local host. this may take 10 seconds

bundle exec jekyll serve 2>&1 | grep -E -v 'deprecated|GitHub Metadata'

# the last part is used to suppress warning
# 2>&1 | grep -E -v 'deprecated|GitHub Metadata'
