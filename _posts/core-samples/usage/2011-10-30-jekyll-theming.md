---
layout: post
categories : usage
---


## Creating Your Layout

Jekyll-bootstrap uses [twitter bootstrap](http://twitter.github.com/bootstrap) to provide the layout structure.
This is because I am not a designer. (designers please contribute themes to Jekyll-bootstrap!)

To get up and running the fastest you might just take a peak at the twitter bootstrap design elements
and setup a quick template that you are happy with.


### Static Assets

The `assets` folder follows a logical structure:
`css` folder contain css, `javascripts` folder contain javascript files etc.
You can link to these static assets following the logical directory path.

### Create a Base Template

The base template in Jekyll-bootstrap is at: `/_layouts/default.html`
You can see how the global layout is defined and how assets are linked to.

### Create a Post Template

The post template in Jekyll-bootstrap is at:  `/_layouts/post.html`
This template is a sub-template that all posts refer to. You can see the post template defines
the default template its parent layout. 
