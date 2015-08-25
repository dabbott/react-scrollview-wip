BIN = ./node_modules/.bin

publish-gh-pages:
	git checkout gh-pages
	git merge master gh-pages
	gulp build
	git add --all .
	git commit -m "New release"
	git push origin gh-pages
	git checkout master

deploy:
	git checkout master
	git subtree split --prefix site/public -b gh-pages
	git checkout gh-pages
	cp site/public/* .
	git add bundle.js bundle.js.map
	git commit -m "New release"
	git push -f origin gh-pages:gh-pages
	git branch -D gh-pages
