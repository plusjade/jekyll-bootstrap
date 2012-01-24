---
layout : post
categories : usage
tags : [permalinks, urls]
---

Your Jekyll-Bootstrap blog can be configured by setting options within the `./_config.yml` file.
You'll note the extensive documentation provided within the file itself. Let's go over some of these in detail:

## Blog Post Permalink Format

Jekyll provides extensive customization options as to how your blog post permalinks will be generated.
You can consult the format table here: [Jekyll Permalinks](https://github.com/mojombo/jekyll/wiki/Permalinks)

Jekyll-Bootstrap ships with the traditional default format for blogs:

    permalink: /:categories/:year/:month/:day/:title/
    
Any category structure specified on a post will be included within the url, then the date, and finally the post title.

Play around with what url configuration works best for you.

## Set BASE\_PATH

**All post and page urls in Jekyll-Bootstrap expect to be prepended with `BASE_PATH`**

The `BASE_PATH` configuration is for special scenarios in which your blog must run from a sub-directory.
The main scenario being if your blog will be hosted on a GitHub **Project** Page.
If you are deploying this website for one of your GitHub projects you must set `BASE_PATH` to the name of your GitHub project.

In any case, you can leave this blank if you have defined a `CNAME` for your site. More info is available at: <http://pages.github.com>

**NOTE:**    
When in localhost, your site will run from root "/" regardless of `BASE_PATH`.


## Enabling Comments

Jekyll-Bootstrap ships with widget codes that enable commenting for [Disqus](http://disqus.com), [Intense Debate](http://intensedebate.com), and [livefyre](http://www.livefyre.com/).

To enable commenting for your blog you will need to have setup an account with one of these providers.
In the `_config.yml` you should see a hash named `comments` as shown below:

    # Settings for comments helper
    # Set 'provider' to the comment provider you want to use.
    # Set 'provider' to false to turn commenting off globally.
    #
    comments :
      provider : disqus
      disqus :
        short_name : jekyllbootstrap
      livefyre :
        site_id : 123
      intensedebate :
        account : 123abc
      facebook :
        apikey : 123


### Choose a Provider

Set `provider` to the provider you intend to use. Make sure to specify your account credentials for the relevant provider within the hash named for _that_ provider.

In the example above, the **disqus** provider will be used and will be provided with **jekyllbootstrap** as the account **short\_name**.

### Use a Custom Provider

To use a custom provider, set `provider: custom`. Next create a file at this path:

    ./_includes/custom/comments
    
This file will load wherever the theme has included its comments so you can inject your own widget code via this file.
If you have a provider I don't know about, consider opening a [GitHub Issue](http://github.com/plusjade/jekyll-bootstrap/issues) so I can include it!
    
### Disable Comments

Set `provider: false` to disable comments globally. 

Disable comments for individual pages/posts by specifying `comments: false` in the page/post YAML Front Matter:

    ---
    layout: post
    category : lessons
    comments : false
    tags : [yay]
    ---


## Enabling Analytics

Jekyll-Bootstrap ships with website analytics codes for [Google](http://google.com/analytics), and [GetClicky](http://getclicky.com).

To enable analytics for your blog you will need to have setup an account with one of these providers.
In the `_config.yml` you should see a hash named `analytics` as shown below:

    # Settings for analytics helper
    # Set 'provider' to the analytics provider you want to use.
    # Set 'provider' to false to turn analytics off globally.
    #        
    analytics :
      provider : google
      google : 
          tracking_id : 'UA-123-12'
      getclicky :
        site_id :


### Choose a Provider

Set `provider` to the provider you intend to use. Make sure to specify your account credentials for the relevant provider within the hash named for _that_ provider.

In the example above, the **google** provider will be used and will be provided with **UA-123-12** as the account **tracking\_id**.

### Use a Custom Provider

To use a custom provider, set `provider: custom`. Next create a file at this path:

    ./_includes/custom/analytics

This file will load wherever the theme has included its analytics so you can inject your own widget code via this file.
If you have a provider I don't know about, consider opening a [GitHub Issue](http://github.com/plusjade/jekyll-bootstrap/issues) so I can include it!

### Disable Analytics

Set `provider: false` to disable analytics globally. 

Disable analytics for individual pages/posts by specifying `analytics: false` in the post/page YAML Front Matter:

    ---
    layout: post
    category : lessons
    analytics : false
    tags : [yay]
    ---
    
    