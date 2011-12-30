---
layout: page
categories : usage
---

Deploying a jekyll-based website comes in two flavors.
You can deploy to GitHub Pages or you can deploy to your own custom server.

## Deploy Jekyll to GitHub Pages

You can deploy Jekyll to your GitHub account and GitHub will parse your repo through Jekyll and host the result on username.github.com
This is very nice of GitHub and the most convenient strategy.
However you cannot extend jekyll via plugins with this version because GitHub will not run them for security reasons.

[GitHub Pages](http://pages.github.com) provides a comprehension tutorial to deploying your Jekyll repository to GitHub Pages.


### Jekyll-Bootstrap is Built to Run on GitHub Pages.
<http://jekyllbootstrap.com> itself, is running via GitHub pages.
You can see that this website is also available at: <http://plusjade.github.com/jekyll-bootstrap>.

If you follow the development practices outlined in Jekyll-bootstrap all you have to do is
clone the jekyll-bootstrap framework, clear out the posts and pages and add in your own content.
Then push this to github as per the [GitHub Pages](http://pages.github.com) tutorial.

Please [contact me](http://plusjade.com) if you run into any trouble.


## Deploy Jekyll to Your Custom Server

The main reason you'd want to host your website yourself is because you can then run custom plugins and customize Jekyll to your heart's content.

Please see the original docs for [custom Jekyll deployment strategies](https://github.com/mojombo/jekyll/wiki/Deployment).



