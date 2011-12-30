---
layout : post
categories : usage
tags : [permalinks, urls]
---

URL configuration is an important aspect of Jekyll as users usually require
total control over how links to their content are handled. Fortunately Jekyll provides extensive customization options as to how your permalinks will be generated:

[Jekyll Permalinks](https://github.com/mojombo/jekyll/wiki/Permalinks)

## Jekyll-Bootstrap's URL Configuration

A peek into `_config.yml` notes that Jekyll-bootrap uses this configuration:

    permalink: /:categories/:title.html
    
    
This means any category specified on a post will be included within the url, followed by the post title.

Traditionally a blog will namespace its post by date, for example:

    permalink: /:categories/:year/:month/:day/:title/
    

Play around with what url configuration works best for you.    