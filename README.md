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

Be sure to deploy on a Heroku _Cedar_ app ([user_env_compile](https://devcenter.heroku.com/articles/labs-user-env-compile) enabled) with the following env var:

``` base
BUILDPACK_URL        => https://github.com/jilion/heroku-buildpack-jekyll.git
BUNDLE_WITHOUT       => development:test:tools
GEM_PATH             => vendor/bundle/ruby/1.9.1
PATH                 => bin:vendor/bundle/ruby/1.9.1/bin:/usr/local/bin:/usr/bin:/bin
RACK_ENV             => staging|production
S3_ACCESS_KEY_ID     => XXX
S3_SECRET_ACCESS_KEY => XXX
```

and simply deploy with:

``` bash
git push staging|production
```
