# Jilion Blog

## Installation

copy `.gitconfig` content to `.git/config`

``` bash
bundle install
```

## Development

Regenerate (inside _site) & launch dev server (http://localhost:4000):

``` bash
bundle exec ejekyll
```

Regenerate as production env (for testing):

``` bash
RACK_ENV=production TIMESTAMP=123456 bundle exec ejekyll --no-server --no-auto
```

## Documentations

- [http://jekyllrb.com](http://jekyllrb.com)
- [http://wiki.github.com/mojombo/jekyll](http://wiki.github.com/mojombo/jekyll)
- [http://wiki.github.com/tobi/liquid/liquid-for-designers](http://wiki.github.com/tobi/liquid/liquid-for-designers)

## Deployment

``` bash
rake deploy:production
# or
rake deploy:staging
git push origin master
```