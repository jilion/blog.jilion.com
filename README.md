# Jilion Blog

## Installation

1. Copy `.gitconfig` content to `.git/config`: `cp .gitconfig .git/config`.
2. Edit `.git/config` as necessary: `m .git/config`.
3. Install the gems bundle: `bi`.

## New post

1. Create a new branch: `gco -b my-awesome-new-post`
2. Create your new post in the `_posts` folder: `m _posts/2013-05-23-my-awesome-new-post.md`.
3. Write the post.

### Preview your post locally

1. Launch the local `ejekyll` server: `be ejekyll serve --watch`.
2. Visit http://localhost:4000: `open http://localhost:4000`.

### Preview your post in staging

```bash
gp staging && heroku apps:open --app jilion-blog-staging
```

## Publish your post

1. CDNize the assets URLs. ProTip: replace `{{site.s3_assets_url}}` with
  `{{site.cdn_assets_url}}` in your post.
2. Preview your post in staging to ensure all is good (see above for
  instructions).
3. Once the post is validated. Merge your branch into master: `gco master && gm
  my-awesome-new-post`
4. Deploy to Heroku: `gp production && open http://blog.jilion.com`
5. Enjoy and don't forget to tweet about the post!

## Additional resources

* http://jekyllrb.com
* http://wiki.github.com/mojombo/jekyll
* http://wiki.github.com/tobi/liquid/liquid-for-designers
* https://github.com/jilion/heroku-buildpack-jekyll/tree/production
