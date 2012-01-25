---
layout : post
title : Jekyll Bootstrap API
categories : api
tags : api
---

Jekyll-Bootstrap takes advantage of Jekyll's ability to "include" files within other files.
This allows us to package chunks of complex [Liquid](http://liquidmarkup.org/) code into reusable modules that 
can be called throughout your templates, pages, and posts.

If you are familiar with ruby on rails this pattern is essentially the same as defining methods in a view helper module and invoking them in your views.

## How it Works

### Define a new "method"

Jekyll-Bootstrap uses includes to emulate a ruby method.
First encapsulate your liquid code logic in a Jekyll include file:

{% capture text %}|.% if site.JB.tags_list.provider == "custom" %.|
  |.% include custom/tags_list %.|
|.% else %.|
  |.% if tags_list.first[0] == null %.|
    |.% for tag in tags_list %.| 
    	<li><a href="|.{ BASE_PATH }.||.{ site.JB.tags_path }.|#|.{ tag }.|-ref">|.{ tag }.| <span>|.{ site.tags[tag].size }.|</span></a></li>
    |.% endfor %.|
  |.% else %.|
    |.% for tag in tags_list %.|
    	<li><a href="|.{ BASE_PATH }.||.{ site.JB.tags_path }.|#|.{ tag[0] }.|-ref">|.{ tag[0] }.| <span>|.{ tag[1].size }.|</span></a></li>
    |.% endfor %.|
  |.% endif %.|
|.% endif %.|
|.% assign tags_list = null %.|{% endcapture %}    
{% include JB/liquid_raw %}

The example above is `JB/tags_list` which is a helper to list tags and their total counts. 

In order to emulate passing arguments to the method, your include should reference localized variables whenever possible.
Now we can pass in arguments by defining the local variables immediately before calling the include file:

### Invoking the Method.

{% capture text %}<ul>
  |.% assign tags_list = site.tags %.|
  |.% include JB/tags_list %.|
</ul>{% endcapture %}
{% include JB/liquid_raw %}

You can define as many "arguments" as you want, just remember to nullify them all at the end of your include to preserve modularity.

### Gotchas

In Liquid, it is impossible to inline assign a variable to anything other than a string.
This means you can't pass in arrays, hashes, etc.
However, as shown above, you can pass-by-reference, and assign local variables to variables that already exist.

So to pass in data-structures, you need to define them in your YAML Front Matter, or `_config.yml` file first, then pass them in by reference.

## Contibuting 

If you have a good idea for another helper, please follow the outlines above,
then submit a pull request to [Jekyll-Bootstrap](http://github.com/plusjade/jekyll-bootstrap) and I'll include it. 



# Methods


## JB/analytics

Includes analytics tracking code into your website.

{% capture text %}|.% include JB/analytics %.|{% endcapture %}
{% include JB/liquid_raw %}    

By default, analytics **are not loaded** when in localhost (development).
Analytics are loaded when `site.safe` is set to true. GitHub sets this flag so we treat a true setting as "production" mode.

This method should be used within a theme's default.html layout file.
Configuration for this method is outlined at: [Jekyll Configuration System](/usage/blog-configuration.html)

## JB/categories\_list

Provides a convenient way to list categories.

### List Sitewide Categories

List site-wide categories by passing in the `site.categories` variable:

{% capture text %}<ul>
  |.% assign categories_list = site.categories %.|
  |.% include JB/categories_list %.|
</ul>{% endcapture %}
{% include JB/liquid_raw %}

### List Categories for a Specific Post

You can also list categories specific to a post:

{% capture text %}<ul>
  |.% assign categories_list = page.categories %.|
  |.% include JB/categories_list %.|
</ul>{% endcapture %}
{% include JB/liquid_raw %}

### List Categories Per Post Iteratively

Finally let's iterate through all posts:

{% capture text %}|.% for post in site.posts %.|
  <h3>Categories for: |.{post.title}.|</h3>  
  <ul>
    |.% assign categories_list = post.categories %.|  
    |.% include JB/categories_list %.|
  </ul>
|.% endfor %.|{% endcapture %}
{% include JB/liquid_raw %}


### Source
    
    ./_includes/JB/categories_list
    

## JB/comments

Includes a commenting system on blog post pages.

{% capture text %}|.% include JB/comments %.|{% endcapture %}
{% include JB/liquid_raw %}    

Depending on your provider, comments may not always work when on localhost (development).

This method should be used within a theme's post.html layout file.
Configuration for this method is outlined at: [Jekyll Configuration System](/usage/blog-configuration.html)




## JB/pages\_list

Provides a convenient way to list pages.

### List All Pages

{% capture text %}<ul>
  |.% assign pages_list = site.pages %.|
  |.% include JB/pages_list %.|
</ul>{% endcapture %}
{% include JB/liquid_raw %}

### List Pages From a Sub-Group

Pages cannot have categories. However we can setup a similar functionality
by manually associating a page to a "group". Do this in the page's yaml front matter:

    ---
    layout: default
    title: A Nice Title
    group: project
    ---

You then pass the group name to the pages\_list helper:

{% capture text %}<ul>
  |.% assign pages_list = site.pages %.|
  |.% assign group = 'project' %.|
  |.% include JB/pages_list %.|
</ul>{% endcapture %}
{% include JB/liquid_raw %}

### Source

    ./_includes/JB/pages_list





## JB/posts\_collate

Organize and list posts in month/year clusters.

### Collate All Posts in Reverse Chronological Order

By default all posts are organized in reverse-chronological order - newest to oldest.

{% capture text %}|.% assign posts_collate = site.posts %.|
|.% include JB/posts_collate %.|{% endcapture %}
{% include JB/liquid_raw %}


### Collate a Sub-Set of Posts

To collate a sub-set of posts, just pass in the sub-set.
Bellow, only posts tagged "jekyll" will be collated:

{% capture text %}|.% assign posts_collate = site.tags.jekyll %.|
|.% include JB/posts_collate %.|{% endcapture %}
{% include JB/liquid_raw %}


### Source
    
    ./_includes/JB/posts_collate





## JB/setup

Provides global Liquid variables to all layouts, posts, and pages.

{% capture text %}|.% include JB/setup %.|{% endcapture %}
{% include JB/liquid_raw %}

This is automatically included for you when you use `rake post` and `rake page` to create posts and pages.

The most relevant variables this sets is `BASE_PATH` which should be prepended to all post and page links,
and `ASSET_PATH` which should be prepended to all theme-specific assets.

These paths dynamically change based on localhost vs production mode as a convenience to you.



## JB/sharing

**This is not finished yet =(**

Includes sharing widgets on your blog post pages.

Examples include tweet, plusone, like, reddit, etc.

{% capture text %}|.% include JB/sharing %.|{% endcapture %}
{% include JB/liquid_raw %}    

This should be specified within a theme's post.html layout file.
Configuration for this method is outlined at: [Jekyll Configuration System](/usage/blog-configuration.html)


## JB/tags\_list

Provides a list of tags and their total counts.

### List Sitewide Tags

You can list sitewide tags by passing in the `site.tags` variable:

{% capture text %}<ul>
  |.% assign tags_list = site.tags %.|
  |.% include JB/tags_list %.|
</ul>{% endcapture %}
{% include JB/liquid_raw %}

### List Tags for a Specific Post

You can also list tags specific to a post:

{% capture text %}<ul>
  |.% assign tags_list = page.tags %.|
  |.% include JB/tags_list %.|
</ul>{% endcapture %}
{% include JB/liquid_raw %}

### List Tags Per Post Iteratively

Finally let's iterate through all posts:

{% capture text %}|.% for post in site.posts %.|
  <h3>Tags for: |.{post.title}.|</h3>  
  <ul>
    |.% assign tags_list = post.tags %.|  
    |.% include JB/tags_list %.|
  </ul>
|.% endfor %.|{% endcapture %}
{% include JB/liquid_raw %}

### Source

    ./_includes/JB/tags_list
    



# Method Overrides

All Jekyll-Bootstrap methods documented above can be overridden with a custom implementation.
**Editing Jekyll-Bootstrap files directly is not encouraged** because it will make upgrading to the latest release more problematic.

Instead you can define another file with your own customizations. 
This is useful if you want to define an alternative HTML output syntax for things like tag and page lists. 
You also might want to override a comment provider with your own custom comment provider.


## Usage

### 1. Set Configuration


Let Jekyll-Bootstrap know you want to override a method by updating your `_config.yml` file.

Within the `JB` hash you must define (if not already defined) a hash with the key as the name of the method you intend to override:

    JB :
      tags_list :
        provider : "custom"
   
The above code tells Jekyll-Bootstrap that you want the `tags_list` provider to be `custom`.

### 2. Add custom file

Next you'll need to define a file at the path:

    ./_includes/custom/tags_list
    
This file, exactly as named, will be used in place of the source Jekyll-Bootstrap file.
You'll probably want to copy the "meat" of the code logic from the original source file into your custom file and then edit it as needed.
    
You can follow this procedure for as many methods as you wish.
