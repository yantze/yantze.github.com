deploy:
	cd .deploy
	cp -r ../public/* .
	git add -A .
	git commit -m 'Site updated'
	@git push -fq https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git gh-pages > /dev/null
