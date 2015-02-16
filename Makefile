deploy:
	cp -r public/* .deploy
	git add -A .
	git commit -m 'Site updated'
	@git push -fq https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git gh-pages > /dev/null
